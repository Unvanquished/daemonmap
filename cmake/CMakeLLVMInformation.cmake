find_program( CLANG clang )
find_program( LLVM_LINK llvm-link )
if( NOT CLANG OR NOT LLVM_LINK )
  message( FATAL_ERROR "clang is not installed" )
endif()

set( CMAKE_LLVM_COMPILER_ENV_VAR LLVMCC )

set( CMAKE_LLVM_COMPILER "${CLANG}" CACHE STRING "" )
set( CMAKE_LLVM_LINKER "${LLVM_LINK}" CACHE STRING "" )
set( CMAKE_LLVM_FLAGS "" CACHE STRING "" )
set( CMAKE_INCLUDE_FLAG_LLVM -I )
set( CMAKE_LLVM_SOURCE_FILE_EXTENSIONS llvm )
set( CMAKE_LLVM_OUTPUT_EXTENSION .bc )
set( CMAKE_LLVM_COMPILE_OBJECT "<CMAKE_LLVM_COMPILER> <DEFINES> <FLAGS> -o <OBJECT> -S <SOURCE>" )
set( CMAKE_LLVM_CREATE_SHARED_LIBRARY "${CMAKE_LLVM_LINKER} -o <TARGET> <OBJECTS>" )
set( CMAKE_LLVM_LINK_EXECUTABLE "<CMAKE_LLVM_COMPILER> <FLAGS> <CMAKE_LLVM_LINK_FLAGS> <LINK_FLAGS> <OBJECTS> -o <TARGET>")

set( CMAKE_LLVM_FLAGS_INIT "$ENV{CFLAGS} ${CMAKE_C_FLAGS_INIT}" )
if( CMAKE_LLVM_FLAGS_INIT STREQUAL " ")
  set( CMAKE_LLVM_FLAGS_INIT)
endif()

set( CMAKE_LLVM_FLAGS "${CMAKE_LLVM_FLAGS_INIT}" CACHE STRING
     "Flags used by the compiler during all build types.")
set( CMAKE_LLVM_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG_INIT}" CACHE STRING
     "Flags used by the compiler during debug builds.")
set( CMAKE_LLVM_FLAGS_MINSIZEREL "${CMAKE_C_FLAGS_MINSIZEREL_INIT}" CACHE STRING
    "Flags used by the compiler during release minsize builds.")
set( CMAKE_LLVM_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE_INIT}" CACHE STRING
    "Flags used by the compiler during release builds (/MD /Ob1 /Oi /Ot /Oy /Gs will produce slightly less optimized but smaller files).")
set( CMAKE_LLVM_FLAGS_RELWITHDEBINFO "${CMAKE_C_FLAGS_RELWITHDEBINFO_INIT}" CACHE STRING
    "Flags used by the compiler during Release with Debug Info builds.")

mark_as_advanced(
  CLANG
  CMAKE_LLVM_COMPILER
  CMAKE_LLVM_LINKER
  CMAKE_LLVM_FLAGS
  CMAKE_LLVM_FLAGS_DEBUG
  CMAKE_LLVM_FLAGS_MINSIZEREL
  CMAKE_LLVM_FLAGS_RELEASE
  CMAKE_LLVM_FLAGS_RELWITHDEBINFO
  LLVM_LINK
)

set( CMAKE_LLVM_INFORMATION_LOADED 1 )
