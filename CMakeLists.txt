cmake_minimum_required(VERSION 3.31)
project(LLLama)

add_executable(${PROJECT_NAME} disasm.c bytecode.c opcodes.c main.c memory.c)
