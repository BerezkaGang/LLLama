#include <cstddef>
extern "C" {
#include "bytecode.h"
#include "opcodes.h"
}

#include <cstdint>
#include <cstdio>
#include <cstdlib>

#include "decode.h"

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

size_t getOperandsCount(uint8_t opcode) {
  switch (opcode) {
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
  case OP_END:
  case OP_STA:
  case OP_DROP:
  case OP_DUP:
  case OP_SWAP:
  case OP_ELEM:
  case OP_PATT_STR_CMP:
  case OP_PATT_STRING:
  case OP_PATT_ARRAY:
  case OP_PATT_SEXP:
  case OP_PATT_BOXED:
  case OP_PATT_UNBOXED:
  case OP_PATT_CLOSURE:
  case OP_EOF:
    return 0;
  case OP_CONST:
  case OP_STRING:
  case OP_JMP:
  case OP_CJMP_Z:
  case OP_CJMP_NZ: 
  case OP_LD_GLO:
  case OP_LD_LOC:
  case OP_LD_ARG:
  case OP_LD_CLO:
  case OP_ST_GLO:
  case OP_ST_LOC:
  case OP_ST_ARG:
  case OP_ST_CLO:
  case OP_CALLC:
  case OP_ARRAY:
  case OP_LINE:
  case OP_BARRAY:
    return 1;
  case OP_SEXP:
  case OP_BEGIN: 
  case OP_CLOSURE: // designations not included
  case OP_CALL:
  case OP_TAG:
  case OP_FAIL:
  case OP_FAIL_KEEP:
    return 2;
  case OP_BEGIN_CLOSURE:
    return 3;
  default:
    fprintf(stderr, "Unknown opcode: %d\n", opcode);
    abort();
  }
}

Instr readInstr(byte_reader* reader) {
  Instr instr;
  instr.opcode = reader_u8(reader);
  for (size_t i = 0; i < getOperandsCount(instr.opcode); ++i) {
    instr.operands[i] = reader_i32(reader);
  }
  if (instr.opcode == OP_CLOSURE) {
    static constexpr size_t DESIGNATION_SIZE = sizeof(uint8_t) + sizeof(uint32_t);
    reader_skip(reader, instr.operands[2] * DESIGNATION_SIZE);
  }
  return instr;
}

void printInstr(FILE* f, byte_reader* reader, const bytecode *bc, Instr instr) {
  uint8_t x = instr.opcode;

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
  case OP_CALLC:
  case OP_ARRAY:
  case OP_LINE:
  case OP_BARRAY:
  case OP_LD_GLO:
  case OP_LD_LOC:
  case OP_LD_ARG:
  case OP_LD_CLO:
  case OP_ST_GLO:
  case OP_ST_LOC:
  case OP_ST_ARG:
  case OP_ST_CLO:
    fprintf(f, "%s\t%d", opcode_to_string(x), instr.operands[0]);
    break;

  case OP_STRING:
    fprintf(f, "%s\t", opcode_to_string(x));
    print_escaped_string(f, bytecode_get_string(bc, instr.operands[1]));
    break;

  case OP_SEXP:
  case OP_TAG:
    fprintf(f, "%s\t", opcode_to_string(x));
    print_escaped_string(f, bytecode_get_string(bc, instr.operands[0]));
    fprintf(f, " %d", instr.operands[1]);
    break;

  case OP_END:
  case OP_STA:
  case OP_DROP:
  case OP_DUP:
  case OP_SWAP:
  case OP_ELEM:
  case OP_PATT_STR_CMP:
  case OP_PATT_STRING:
  case OP_PATT_ARRAY:
  case OP_PATT_SEXP:
  case OP_PATT_BOXED:
  case OP_PATT_UNBOXED:
  case OP_PATT_CLOSURE:
  case OP_EOF:
    fprintf(f, "%s", opcode_to_string(x));
    break;

  case OP_JMP:
  case OP_CJMP_Z:
  case OP_CJMP_NZ:
    fprintf(f, "%s\t0x%.8x", opcode_to_string(x),
            (unsigned int)instr.operands[0]);
    break;

  case OP_BEGIN:
    fprintf(f, "%s\t%d %d", opcode_to_string(x),
            instr.operands[0], instr.operands[1]);
    break;

  case OP_BEGIN_CLOSURE:
    fprintf(f, "%s\t%d %d %d", opcode_to_string(x),
            instr.operands[0], instr.operands[1], instr.operands[2]);
    break;

  case OP_CLOSURE: {
    int32_t n = instr.operands[1];

    fprintf(f, "%s\t0x%.8x %d", opcode_to_string(x),
            (unsigned int)instr.operands[0], n);

    size_t pos = reader_pos(reader); 
    for (int32_t i = 0; i < n; i++) {
      uint8_t ref = reader_u8(reader);
      fprintf(f, " %u %d", (unsigned int)ref, reader_i32(reader));
    }
    reader_seek(reader, pos);
    break;
  }

  case OP_CALL:
    fprintf(f, "%s\t0x%.8x %d", opcode_to_string(x),
            (unsigned int)instr.operands[0], instr.operands[1]);
    break;

  case OP_FAIL:
  case OP_FAIL_KEEP:
    fprintf(f, "%s\t%d %d", opcode_to_string(x),
            instr.operands[0], instr.operands[1]);
    break;

  default:
    fprintf(f, "%s", opcode_to_string(x));
    break;
  }
}
