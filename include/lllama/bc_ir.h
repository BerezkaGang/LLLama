extern "C" {
#include "lllama/bytecode.h"
}

// TODO: move to header
void runBytecode(FILE *f, const bytecode *bc);
