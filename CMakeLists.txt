project(lama-jit)


add_executable(jit disasm.c bytecode.c opcodes.c main.c memory.c)
