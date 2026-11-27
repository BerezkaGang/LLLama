#include <cstdio>
#include "lllama/bc_ir.h"

int main(int argc, char **argv) {
  bytecode* bc = bytecode_load(argv[1]);
  runBytecode(stdout, bc);
  return 0;
}
