#include <cstddef>
extern "C" {
#include "bytecode.h"
}

#include <cstdint>
#include <cstdio>
#include <cstdlib>

struct Instr {
  static constexpr size_t MAX_OPERANDS = 3;

  uint8_t opcode;
  uint32_t operands[MAX_OPERANDS];
};

size_t getOperandsCount(uint8_t opcode);
Instr readInstr(byte_reader* reader); 
void printInstr(FILE* f, byte_reader* reader, const bytecode *bc, Instr instr); 
