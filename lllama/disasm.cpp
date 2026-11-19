#include <cstddef>
#include <memory>
extern "C" {
#include "bytecode.h"
#include "opcodes.h"
}
#include "disasm.h"

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Module.h>

using namespace llvm;

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

struct BBInfo {
  BasicBlock* bb;
  std::vector<Value*> stack;
  std::vector<Value*> entryStack;  // phi nodes
  bool visited = false;
  std::vector<size_t> pred;
};

static void disassemble(FILE *f, const bytecode *bc) {
  LLVMContext context;
  IRBuilder<> builder(context);
  auto mod = std::make_unique<Module>("jit", context);
  auto void_ = builder.getVoidTy();
  auto prototype = FunctionType::get(void_, false);
  auto appFunc =
      Function::Create(prototype, Function::ExternalLinkage, "app", mod.get());
  std::unordered_map<size_t, BBInfo> bbInfo;

  byte_reader reader;
  reader_init(&reader, bc->code, bc->code_size);
  std::vector<size_t> queue;
  auto i32 = builder.getInt32Ty();

  std::vector<GlobalVariable*> globals;
  for (size_t i = 0; i < bc->globals_count; ++i) {
    globals.push_back(
        new GlobalVariable(
            /*Module=*/*mod, 
            /*Type=*/i32,
            /*isConstant=*/false,
            /*Linkage=*/GlobalValue::CommonLinkage,
            /*Initializer=*/nullptr, // has initializer, specified below
            /*Name=*/"abc"
          )
        );
  }

  fprintf(f, "Checking BB\n");
  bool end = false;
  while (!end) {
    size_t offset = reader_pos(&reader);
    uint8_t x = reader_u8(&reader);

    fprintf(f, "0x%.8x:\t", (unsigned int)offset);

    switch (x) {
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
    case OP_BINOP_OR:
      fprintf(f, "%s", opcode_to_string(x));
      break;

    case OP_CONST:
      fprintf(f, "%s\t%d", opcode_to_string(x), reader_i32(&reader));
      break;

    case OP_STRING:
      fprintf(f, "%s\t", opcode_to_string(x));
      print_escaped_string(f, bytecode_get_string(bc, reader_i32(&reader)));
      break;

    case OP_SEXP:
      fprintf(f, "%s\t", opcode_to_string(x));
      print_escaped_string(f, bytecode_get_string(bc, reader_i32(&reader)));
      fprintf(f, " %d", reader_i32(&reader));
      break;

    case OP_END:
      fprintf(f, "%s", opcode_to_string(x));
      end = true;
      break;
    case OP_STA:
    case OP_DROP:
    case OP_DUP:
    case OP_SWAP:
    case OP_ELEM:
      fprintf(f, "%s", opcode_to_string(x));
      break;

    case OP_JMP:
    case OP_CJMP_Z:
    case OP_CJMP_NZ: {
      fprintf(f, "%s\t0x%.8x", opcode_to_string(x), (unsigned int)reader_i32(&reader));
      auto bb = BasicBlock::Create(context, std::string("bb") + std::to_string(bbInfo.size()), appFunc);
      auto pos = reader_pos(&reader);
      auto& curBBInfo = bbInfo[pos];
      curBBInfo.bb = bb;
      break;
    }

    case OP_LD_GLO:
    case OP_LD_LOC:
    case OP_LD_ARG:
    case OP_LD_CLO:
    case OP_ST_GLO:
    case OP_ST_LOC:
    case OP_ST_ARG:
    case OP_ST_CLO:
      fprintf(f, "%s\t%d", opcode_to_string(x), reader_i32(&reader));
      break;

    case OP_BEGIN: {
      fprintf(f, "%s\t%d ", opcode_to_string(x), reader_i32(&reader));
      fprintf(f, "%d", reader_i32(&reader));
      auto pos = reader_pos(&reader);
      auto bb = BasicBlock::Create(context, std::string("bb") + std::to_string(bbInfo.size()), appFunc);
      auto& curBBInfo = bbInfo[pos];
      curBBInfo.bb = bb;
      queue.push_back(pos);
      break;
     }

    case OP_BEGIN_CLOSURE:
      fprintf(f, "%s\t%d ", opcode_to_string(x), reader_i32(&reader));
      fprintf(f, "%d ", reader_i32(&reader));
      fprintf(f, "%d", reader_i32(&reader));
      break;

    case OP_CLOSURE: {
      int32_t n;
      fprintf(f, "%s\t0x%.8x", opcode_to_string(x),
              (unsigned int)reader_i32(&reader));
      n = reader_i32(&reader);
      fprintf(f, " %d", n);
      for (int32_t i = 0; i < n; i++) {
        uint8_t ref = reader_u8(&reader);
        fprintf(f, " %u %d", (unsigned int)ref, reader_i32(&reader));
      }
      break;
    }

    case OP_CALLC:
    case OP_ARRAY:
    case OP_LINE:
      fprintf(f, "%s\t%d", opcode_to_string(x), reader_i32(&reader));
      break;
    case OP_CALL:
      fprintf(f, "%s\t0x%.8x ", opcode_to_string(x),
              (unsigned int)reader_i32(&reader));
      fprintf(f, "%d", reader_i32(&reader));
      break;

    case OP_TAG:
      fprintf(f, "%s\t", opcode_to_string(x));
      print_escaped_string(f, bytecode_get_string(bc, reader_i32(&reader)));
      fprintf(f, " %d", reader_i32(&reader));
      break;

    case OP_FAIL:
    case OP_FAIL_KEEP:
      fprintf(f, "%s\t%d", opcode_to_string(x), reader_i32(&reader));
      fprintf(f, "%d", reader_i32(&reader));
      break;

    case OP_PATT_STR_CMP:
    case OP_PATT_STRING:
    case OP_PATT_ARRAY:
    case OP_PATT_SEXP:
    case OP_PATT_BOXED:
    case OP_PATT_UNBOXED:
    case OP_PATT_CLOSURE:
      fprintf(f, "%s", opcode_to_string(x));
      break;

    case OP_BARRAY:
      fprintf(f, "%s\t%d", opcode_to_string(x), reader_i32(&reader));
      break;

    case OP_EOF:
      fprintf(f, "%s\n", opcode_to_string(x));
      break;

    default:
      fprintf(f, "%s\n", opcode_to_string(x));
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
      curBBInfo.entryStack[i] = builder.CreatePHI(i32, 0);
      curBBInfo.stack.push_back(curBBInfo.entryStack[i]);
    }

    reader_seek(&reader, curOffset);
    bool end = false;
    while (!end) {
      size_t offset = reader_pos(&reader);
      uint8_t x = reader_u8(&reader);

      fprintf(f, "0x%.8x:\t", (unsigned int)offset);

      switch (x) {
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
        fprintf(f, "%s", opcode_to_string(x));
        fflush(f);
        auto second = curBBInfo.stack.back();
        curBBInfo.stack.pop_back();
        auto first = curBBInfo.stack.back();
        curBBInfo.stack.pop_back();
        // TODO: runtime call
        auto res = builder.CreateAdd(first, second);
        curBBInfo.stack.push_back(res);
        break;
      }

      case OP_CONST: {
        auto value = reader_i32(&reader);
        auto val = builder.getInt32((value << 1) | 1);
        curBBInfo.stack.push_back(val);
        fprintf(f, "%s\t%d", opcode_to_string(x), value);
        break;
      }

      case OP_STRING:
        fprintf(f, "%s\t", opcode_to_string(x));
        print_escaped_string(f, bytecode_get_string(bc, reader_i32(&reader)));
        break;

      case OP_SEXP:
        fprintf(f, "%s\t", opcode_to_string(x));
        print_escaped_string(f, bytecode_get_string(bc, reader_i32(&reader)));
        fprintf(f, " %d", reader_i32(&reader));
        break;

      case OP_END:
        fprintf(f, "%s", opcode_to_string(x));
        end = true;
        break;
      case OP_STA:
        fprintf(f, "%s", opcode_to_string(x));
        break;
      case OP_DROP: {
        fprintf(f, "%s", opcode_to_string(x));
        curBBInfo.stack.pop_back();
        break;
      }
      case OP_DUP:
      case OP_SWAP:
      case OP_ELEM:
        fprintf(f, "%s", opcode_to_string(x));
        break;

      case OP_JMP:
      case OP_CJMP_Z:
      case OP_CJMP_NZ: {
        auto target = reader_i32(&reader);
        fprintf(f, "%s\t0x%.8x", opcode_to_string(x), target);
        if (x != OP_JMP) {
          curBBInfo.stack.pop_back();
          auto nextOff = reader_pos(&reader);
          queue.push_back(nextOff);
          bbInfo[nextOff].pred.push_back(curOffset);
          bbInfo[nextOff].entryStack.resize(curBBInfo.stack.size());
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
        fprintf(f, "%s\t%d", opcode_to_string(x), reader_i32(&reader));
        break;
      case OP_ST_GLO: {
        auto gloNo = reader_i32(&reader);
        fprintf(f, "%s\t%d", opcode_to_string(x), gloNo);
        builder.CreateStore(curBBInfo.stack.back(), globals[gloNo]);
        break;
      }
      case OP_LD_GLO: {
        auto gloNo = reader_i32(&reader);
        fprintf(f, "%s\t%d", opcode_to_string(x), gloNo);
        fflush(f);
        auto val = builder.CreateLoad(i32, globals[gloNo]);
        curBBInfo.stack.push_back(val);
        break;
      }

      case OP_BEGIN: {
        fprintf(f, "%s\t%d ", opcode_to_string(x), reader_i32(&reader));
        fprintf(f, "%d", reader_i32(&reader));
        auto pos = reader_pos(&reader);
        break;
       }

      case OP_BEGIN_CLOSURE:
        fprintf(f, "%s\t%d ", opcode_to_string(x), reader_i32(&reader));
        fprintf(f, "%d ", reader_i32(&reader));
        fprintf(f, "%d", reader_i32(&reader));
        break;

      case OP_CLOSURE: {
        int32_t n;
        fprintf(f, "%s\t0x%.8x", opcode_to_string(x),
                (unsigned int)reader_i32(&reader));
        n = reader_i32(&reader);
        fprintf(f, " %d", n);
        for (int32_t i = 0; i < n; i++) {
          uint8_t ref = reader_u8(&reader);
          fprintf(f, " %u %d", (unsigned int)ref, reader_i32(&reader));
        }
        break;
      }

      case OP_CALLC:
      case OP_ARRAY:
      case OP_LINE:
        fprintf(f, "%s\t%d", opcode_to_string(x), reader_i32(&reader));
        break;
      case OP_CALL:
        fprintf(f, "%s\t0x%.8x ", opcode_to_string(x),
                (unsigned int)reader_i32(&reader));
        fprintf(f, "%d", reader_i32(&reader));
        break;

      case OP_TAG:
        fprintf(f, "%s\t", opcode_to_string(x));
        print_escaped_string(f, bytecode_get_string(bc, reader_i32(&reader)));
        fprintf(f, " %d", reader_i32(&reader));
        break;

      case OP_FAIL:
      case OP_FAIL_KEEP:
        fprintf(f, "%s\t%d", opcode_to_string(x), reader_i32(&reader));
        fprintf(f, "%d", reader_i32(&reader));
        break;

      case OP_PATT_STR_CMP:
      case OP_PATT_STRING:
      case OP_PATT_ARRAY:
      case OP_PATT_SEXP:
      case OP_PATT_BOXED:
      case OP_PATT_UNBOXED:
      case OP_PATT_CLOSURE:
        fprintf(f, "%s", opcode_to_string(x));
        break;

      case OP_BARRAY:
        fprintf(f, "%s\t%d", opcode_to_string(x), reader_i32(&reader));
        break;

      case OP_EOF:
        fprintf(f, "%s\n", opcode_to_string(x));
        break;

      default:
        fprintf(f, "%s\n", opcode_to_string(x));
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
  mod->print(outs(), nullptr);
}

void dump_bytecode(FILE *f, const bytecode *bc) {
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
  disassemble(f, bc);
}
