#include "disasm.h"
#include "stdio.h"

void dump_bytecode(FILE *f, const bytecode *bc);

int main(int argc, char **argv) {
  bytecode* bc = bytecode_load(argv[1]);
  dump_bytecode(stdout, bc);
  return 0;
}
