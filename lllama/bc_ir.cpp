#include <cstddef>
#include <iostream>
#include <memory>
#include <string_view>
extern "C" {
#include "bytecode.h"
#include "opcodes.h"
#include "runtime_common.h"
}
#include "bc_ir.h"
#include "decode.h"

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Verifier.h>
#include "llvm/ExecutionEngine/ExecutionEngine.h"
#include "llvm/ExecutionEngine/GenericValue.h"
#include "llvm/ExecutionEngine/MCJIT.h"

using namespace llvm;

// TODO: duplicated with decode
static void print_escaped_string(FILE *f, const char *s) {
  for (const uint8_t *p = (const uint8_t *)s; *p; p++) {
    switch (*p) {
    case '"':
      fprintf(f, "\\\"");
      break;
    case '\\':
      switch (p[1]) {
      case '\n':
        fprintf(f, "\\n");
        p++;
        break;
      case '\r':
        fprintf(f, "\\r");
        p++;
        break;
      case '\t':
        fprintf(f, "\\t");
        p++;
        break;
      default:
        fprintf(f, "\\\\");
        break;
      }
      break;
    default:
      if (*p >= 0x20 && *p <= 0x7e) {
        fputc(*p, f);
      } else {
        fprintf(f, "\\x%02x", *p);
      }
      break;
    }
  }
}

template<typename ...Ts>
Value* createBinop(uint8_t opcode, Type* ptrTy, IRBuilder<Ts...>& builder, Value* left, Value* right) {
  switch (opcode) {
  case OP_BINOP_ADD:
    return builder.CreateAdd(left, right);
  case OP_BINOP_SUB:
    return builder.CreateSub(left, right);
  case OP_BINOP_MUL:
    return builder.CreateMul(left, right);
  case OP_BINOP_DIV:
    return builder.CreateSDiv(left, right);
  case OP_BINOP_MOD:
    return builder.CreateSRem(left, right);
  case OP_BINOP_AND:
    return builder.CreateAnd(left, right);
  case OP_BINOP_OR: 
    return builder.CreateOr(left, right);
  }
  CmpInst::Predicate predicate;
  switch (opcode) {
  case OP_BINOP_LT:
    predicate = CmpInst::ICMP_SLT;
    break;
  case OP_BINOP_LE:
    predicate = CmpInst::ICMP_SLE;
    break;
  case OP_BINOP_GT:
    predicate = CmpInst::ICMP_SGT;
    break;
  case OP_BINOP_GE:
    predicate = CmpInst::ICMP_SGE;
    break;
  case OP_BINOP_EQ:
    predicate = CmpInst::ICMP_EQ;
    break;
  case OP_BINOP_NE:
    predicate = CmpInst::ICMP_NE;
    break;
  default:
    assert(false && "Invalid binop");
  }
  Value* cmp = builder.CreateICmp(predicate, left, right);
  return builder.CreateZExt(cmp, ptrTy);
}

class BCtoIR {
private:
  const bytecode *bc;
  FILE *f;
  LLVMContext &context;
  std::unique_ptr<Module> mod;

  struct BBInfo {
    BasicBlock* bb;
    std::vector<Value*> stack;
    std::vector<Value*> entryStack;  // phi nodes
    bool visited = false;
    std::vector<size_t> pred;
  };

public:
  BCtoIR(const bytecode *bc, FILE *log, LLVMContext& context) 
    : bc{bc}, f{log}, context{context} {
    mod = std::make_unique<Module>("jit", context);
  }

  std::unique_ptr<Module> getModule() && {
    return std::move(mod);
  }

  Function* buildFunction(size_t functionAddr) {
    IRBuilder<> builder(context);
    const auto &DL = mod->getDataLayout();
    auto void_ = builder.getVoidTy();
    auto prototype = FunctionType::get(void_, false);
    auto func =
        Function::Create(prototype, Function::ExternalLinkage, "fun" + std::to_string(functionAddr), mod.get());
    std::unordered_map<size_t, BBInfo> bbInfo;

    byte_reader reader;
    reader_init(&reader, bc->code, bc->code_size);
    reader_seek(&reader, functionAddr);
    std::vector<size_t> queue;
    auto ptrTy = builder.getIntPtrTy(DL);

    // TODO: allocate on stack
    std::vector<GlobalVariable*> globals;
    for (size_t i = 0; i < bc->globals_count; ++i) {
      globals.push_back(
          new GlobalVariable(
              /*Module=*/*mod, 
              /*Type=*/ptrTy,
              /*isConstant=*/false,
              /*Linkage=*/GlobalValue::PrivateLinkage,
              /*Initializer=*/ConstantInt::get(ptrTy, 0),
              /*Name=*/"global" + std::to_string(i)
            )
          );
    }

    fprintf(f, "Checking BB\n");
    bool end = false;
    while (!end) {
      size_t offset = reader_pos(&reader);

      fprintf(f, "0x%.8x:\t", (unsigned int)offset);
      Instr instr = readInstr(&reader);
      printInstr(f, &reader, bc, instr);
      switch (instr.opcode) {
      case OP_END:
        end = true;
        break;
      case OP_JMP:
      case OP_CJMP_Z:
      case OP_CJMP_NZ: {
        auto bb = BasicBlock::Create(context, std::string("bb") + std::to_string(bbInfo.size()), func);
        auto pos = reader_pos(&reader);
        auto& curBBInfo = bbInfo[pos];
        curBBInfo.bb = bb;
        break;
      }
      case OP_BEGIN: {
        auto pos = reader_pos(&reader);
        auto bb = BasicBlock::Create(context, std::string("bb") + std::to_string(bbInfo.size()), func);
        auto& curBBInfo = bbInfo[pos];
        curBBInfo.bb = bb;
        queue.push_back(pos);
        break;
       }
      case OP_BEGIN_CLOSURE:
        // TODO
        break;
      }
      fprintf(f, "\n");
    }

    fprintf(f, "Building IR\n");
    while (!queue.empty()) {
      size_t curOffset = queue.back();
      queue.pop_back();
      BBInfo &curBBInfo = bbInfo[curOffset];
      if (curBBInfo.visited) {
        continue;
      }
      curBBInfo.visited = true;
      builder.SetInsertPoint(curBBInfo.bb);
      fprintf(f, "BB %s at 0x%.8x\n", curBBInfo.bb->getName().data(), (unsigned int)curOffset);
      for (size_t i = 0; i < curBBInfo.entryStack.size(); ++i) {
        curBBInfo.entryStack[i] = builder.CreatePHI(ptrTy, 0);
        curBBInfo.stack.push_back(curBBInfo.entryStack[i]);
      }

      reader_seek(&reader, curOffset);
      bool end = false;
      while (!end) {
        size_t offset = reader_pos(&reader);
        Instr instr = readInstr(&reader);
        printInstr(f, &reader, bc, instr);
        size_t nextOffset = reader_pos(&reader);

        fprintf(f, "0x%.8x:\t", (unsigned int)offset);

        switch (instr.opcode) {
        case OP_BINOP_ADD:
        case OP_BINOP_SUB:
        case OP_BINOP_MUL:
        case OP_BINOP_DIV:
        case OP_BINOP_MOD:
        case OP_BINOP_LT:
        case OP_BINOP_LE:
        case OP_BINOP_GT:
        case OP_BINOP_GE:
        case OP_BINOP_EQ:
        case OP_BINOP_NE:
        case OP_BINOP_AND:
        case OP_BINOP_OR: {
          // plain implementation, can be optimized 
          auto right = curBBInfo.stack.back();
          curBBInfo.stack.pop_back();
          auto left = curBBInfo.stack.back();
          curBBInfo.stack.pop_back();
          auto one = ConstantInt::get(ptrTy, 1);
          left = builder.CreateAShr(left, one);
          right = builder.CreateAShr(right, one);
          auto res = createBinop(instr.opcode, ptrTy, builder, left, right);
          res = builder.CreateShl(res, one);
          curBBInfo.stack.push_back(res);
          break;
        }

        case OP_CONST: {
          auto value = instr.operands[0];
          auto val = ConstantInt::get(ptrTy, BOX(value));
          curBBInfo.stack.push_back(val);
          break;
        }

        case OP_STRING:
        case OP_SEXP:
          break;

        case OP_END:
          builder.CreateRetVoid();
          end = true;
          break;

        case OP_STA:
          break;

        case OP_DROP:
          curBBInfo.stack.pop_back();
          break;

        case OP_DUP:
          curBBInfo.stack.push_back(curBBInfo.stack.back());
          break;
        case OP_SWAP:
          std::swap(*(curBBInfo.stack.end() - 1), *(curBBInfo.stack.end() - 2));
          break;
        case OP_ELEM:
          break;

        case OP_JMP:
        case OP_CJMP_Z:
        case OP_CJMP_NZ: {
          auto target = instr.operands[0];

          if (instr.opcode != OP_JMP) {
            auto operand = curBBInfo.stack.back();
            curBBInfo.stack.pop_back();
            queue.push_back(nextOffset);
            bbInfo[nextOffset].pred.push_back(curOffset);
            bbInfo[nextOffset].entryStack.resize(curBBInfo.stack.size());

            auto cond = builder.CreateICmp(
                instr.opcode == OP_CJMP_Z ? CmpInst::ICMP_EQ : CmpInst::ICMP_NE,
                operand,
                ConstantInt::get(ptrTy, BOX(0)));

            builder.CreateCondBr(cond, bbInfo[target].bb, bbInfo[nextOffset].bb);
          } else {
            builder.CreateBr(bbInfo[target].bb);
          }

          queue.push_back(target);
          bbInfo[target].pred.push_back(curOffset);
          bbInfo[target].entryStack.resize(curBBInfo.stack.size());
          end = true;
          break;
        }

        case OP_LD_LOC:
        case OP_LD_ARG:
        case OP_LD_CLO:
        case OP_ST_LOC:
        case OP_ST_ARG:
        case OP_ST_CLO:
          break;

        case OP_ST_GLO: {
          auto gloNo = instr.operands[0];
          builder.CreateStore(curBBInfo.stack.back(), globals[gloNo]);
          break;
        }

        case OP_LD_GLO: {
          auto gloNo = instr.operands[0];
          auto val = builder.CreateLoad(ptrTy, globals[gloNo]);
          curBBInfo.stack.push_back(val);
          break;
        }

        case OP_BEGIN: {
          break;
        }

        case OP_BEGIN_CLOSURE:
          break;

        case OP_CLOSURE: {
          int32_t n = instr.operands[1];

          for (int32_t i = 0; i < n; i++) {
            uint8_t ref = reader_u8(&reader);
            int32_t value = reader_i32(&reader);
          }
          break;
        }

        case OP_CALLC:
        case OP_ARRAY:
        case OP_LINE:
          break; 
        case OP_CALL: {
          int32_t target = instr.operands[0];
          if (target < 0) {
            auto offset = -target - 1;
            std::string_view name = bc->string_table + offset;
            fprintf(f, "\nExternal func: %s", name.data());
            Value* result = nullptr;
            if (name == "read") {
              auto extFunc = mod->getOrInsertFunction(name, ptrTy);
              result = builder.CreateCall(extFunc);
            }
            if (name == "write") {
              auto extFunc = mod->getOrInsertFunction(name, ptrTy, ptrTy);
              Value *arg = curBBInfo.stack.back();
              curBBInfo.stack.pop_back();
              result = builder.CreateCall(extFunc, arg);
            }
            if (result) 
              curBBInfo.stack.push_back(result);
          }
          break;
        }

        case OP_TAG:
          break;

        case OP_FAIL:
        case OP_FAIL_KEEP:
          break;

        case OP_PATT_STR_CMP:
        case OP_PATT_STRING:
        case OP_PATT_ARRAY:
        case OP_PATT_SEXP:
        case OP_PATT_BOXED:
        case OP_PATT_UNBOXED:
        case OP_PATT_CLOSURE:
          break;

        case OP_BARRAY:
        case OP_EOF:
        default:
          break;
        }
        fprintf(f, "\n");
        fprintf(f, "stack size: %zu\n", curBBInfo.stack.size());
      }
    }
    fprintf(f, "Resolving PHI\n");
    for (auto& [curOffset, curBBInfo] : bbInfo) {
      fprintf(f, "BB 0x%.8x with entry stack size %zu\n", (unsigned int)curOffset, curBBInfo.entryStack.size());
      for (auto predBBOffset : curBBInfo.pred) {
        fprintf(f, "Pred 0x%.8x with stack size %zu\n", (unsigned int)predBBOffset, bbInfo[predBBOffset].stack.size());
        for (size_t i = 0; i < curBBInfo.entryStack.size(); ++i) {
          auto phi = static_cast<PHINode*>(curBBInfo.entryStack[i]);
          phi->addIncoming(bbInfo[predBBOffset].stack[i], bbInfo[predBBOffset].bb);
        }
      }
    }
    if (verifyModule(*mod, &errs())) {
      errs() << "Module verification failed!\n";
    }
    mod->print(outs(), nullptr);
    return func;
  }
};

aint read() {
  aint x;
  std::cin >> x;
  return BOX(x);
}

aint write(aint x) {
  std::cout << UNBOX(x) << std::endl;
  return BOX(0);
}

static void run(FILE *f, const bytecode *bc) {
  LLVMContext context;
  BCtoIR builder(bc, f, context);
  auto mainFunc = builder.buildFunction(0);

  LLVMInitializeNativeTarget();
  LLVMInitializeNativeAsmPrinter();
  LLVMLinkInMCJIT();

  ExecutionEngine *ee = EngineBuilder(std::move(builder).getModule()).create();
  ee->InstallLazyFunctionCreator([&](const std::string &fnName) -> void * {
    // TODO: link with runtime instead
    if (fnName == "write") {
      return reinterpret_cast<void*>(write);
    }
    if (fnName == "read") {
      return reinterpret_cast<void*>(read);
    }
    return nullptr;
  });
  ee->finalizeObject();

  ArrayRef<GenericValue> noargs;
  std::cout << "Run main\n";
  GenericValue v = ee->runFunction(mainFunc, noargs);
}

void runBytecode(FILE *f, const bytecode *bc) {
  bytecode_iterator pubs, imports;
  public_symbol pub;
  const char *import_name;

  fprintf(f, "Version:                               %d\n", bc->version);
  fprintf(f, "Size of the string table (in bytes):   %zu\n",
          bc->string_table_size);
  fprintf(f, "Number of global variables:            %zu\n", bc->globals_count);
  fprintf(f, "Number of imports:                     %zu\n", bc->imports_len);
  fprintf(f, "Number of public symbols:              %zu\n", bc->pubs_len);
  fprintf(f, "Code size:                             %zu\n", bc->code_size);
  fprintf(f, "Imports:                               \n");

  bytecode_imports_init(&imports, bc);
  while (bytecode_imports_next(&imports, &import_name)) {
    fprintf(f, "   %s\n", import_name);
  }

  fprintf(f, "Public functions:                      \n");

  bytecode_pubs_init(&pubs, bc);
  while (bytecode_pubs_next(&pubs, &pub)) {
    if (pub.flag == PUB_FLAG_FUNCTION) {
      fprintf(f, "   0x%.8x: %s\n", (unsigned int)pub.code_offset, pub.name);
    }
  }

  fprintf(f, "Public globals:                        \n");

  bytecode_pubs_init(&pubs, bc);
  while (bytecode_pubs_next(&pubs, &pub)) {
    if (pub.flag == PUB_FLAG_GLOBAL) {
      fprintf(f, "   0x%.8x: %s\n", (unsigned int)pub.code_offset, pub.name);
    }
  }

  fprintf(f, "Code:\n");
  run(f, bc);
}
