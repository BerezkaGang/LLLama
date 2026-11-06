add_library(lllamaLib STATIC disasm.c bytecode.c opcodes.c memory.c)
target_include_directories(lllamaLib
    PUBLIC ${PROJECT_SOURCE_DIR}/include
    PRIVATE ${PROJECT_SOURCE_DIR}/include/lllama
)
