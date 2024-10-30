set(CMAKE_SYSTEM_NAME               Generic)
set(CMAKE_SYSTEM_PROCESSOR          arm)

# Some default GCC settings
# arm-none-eabi- must be part of path environment
set(TOOLCHAIN_PREFIX                arm-none-eabi-)
# common C/C++ compiler flags 
set(FLAGS 
    "-fdiagnostics-color=always -fdata-sections -ffunction-sections --specs=nano.specs -Wl,--gc-sections"
)
# enable use of c preprocessor on assembler files
set(ASM_FLAGS "-x assembler-with-cpp")

# -fno-rtti -fno-exceptions -fno-threadsafe-statics
# -fno-sized-deallocation -> prevent sized delete() to be genarated 
#                           which is tricky within FreeRTOS
set(CPP_FLAGS
    "-fdiagnostics-color=always -fno-rtti -fexceptions -fno-threadsafe-statics -fno-sized-deallocation"
)

# Define compiler settings
set(CMAKE_C_COMPILER                ${TOOLCHAIN_PREFIX}gcc ${FLAGS})
set(CMAKE_ASM_COMPILER              ${CMAKE_C_COMPILER} ${ASM_FLAGS})
set(CMAKE_CXX_COMPILER              ${TOOLCHAIN_PREFIX}g++ ${FLAGS} ${CPP_FLAGS})
set(CMAKE_OBJCOPY                   ${TOOLCHAIN_PREFIX}objcopy)
set(CMAKE_SIZE                      ${TOOLCHAIN_PREFIX}size)

set(CMAKE_EXECUTABLE_SUFFIX_ASM     ".elf")
set(CMAKE_EXECUTABLE_SUFFIX_C       ".elf")
set(CMAKE_EXECUTABLE_SUFFIX_CXX     ".elf")

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)