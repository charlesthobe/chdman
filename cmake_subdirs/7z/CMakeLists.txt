#lib7z
set(7z_dir ${CMAKE_SOURCE_DIR}/3rdparty/lzma)

if(CMAKE_GENERATOR STREQUAL "Unix Makefiles" OR CMAKE_GENERATOR STREQUAL "Ninja")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-strict-prototypes -Wno-undef")
endif()

if(CMAKE_C_COMPILER_ID STREQUAL "Clang" AND CMAKE_C_COMPILER_VERSION VERSION_GREATER 10.0)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-misleading-indentation")
endif()

add_compile_definitions(
    _7ZIP_PPMD_SUPPPORT
    _7ZIP_ST
)

add_library(7z STATIC
    ${7z_dir}/C/7zAlloc.c
    ${7z_dir}/C/7zArcIn.c
    ${7z_dir}/C/7zBuf.c
    ${7z_dir}/C/7zBuf2.c
    ${7z_dir}/C/7zCrc.c
    ${7z_dir}/C/7zCrcOpt.c
    ${7z_dir}/C/7zDec.c
    ${7z_dir}/C/7zFile.c
    ${7z_dir}/C/7zStream.c
    ${7z_dir}/C/Aes.c
    ${7z_dir}/C/AesOpt.c
    ${7z_dir}/C/Alloc.c
    ${7z_dir}/C/Bcj2.c
    ${7z_dir}/C/Bra.c
    ${7z_dir}/C/Bra86.c
    ${7z_dir}/C/BraIA64.c
    ${7z_dir}/C/CpuArch.c
    ${7z_dir}/C/Delta.c
    ${7z_dir}/C/DllSecur.c
    ${7z_dir}/C/LzFind.c
    ${7z_dir}/C/LzFindMt.c
    ${7z_dir}/C/LzFindOpt.c
    ${7z_dir}/C/Lzma2Dec.c
    ${7z_dir}/C/Lzma2DecMt.c
    ${7z_dir}/C/Lzma2Enc.c
    ${7z_dir}/C/Lzma86Dec.c
    ${7z_dir}/C/Lzma86Enc.c
    ${7z_dir}/C/LzmaDec.c
    ${7z_dir}/C/LzmaEnc.c
    ${7z_dir}/C/LzmaLib.c
    ${7z_dir}/C/MtCoder.c
    ${7z_dir}/C/MtDec.c
    ${7z_dir}/C/Ppmd7.c
    ${7z_dir}/C/Ppmd7Dec.c
    ${7z_dir}/C/Ppmd7Enc.c
    ${7z_dir}/C/Sha256.c
    ${7z_dir}/C/Sha256Opt.c
    ${7z_dir}/C/Sort.c
    ${7z_dir}/C/SwapBytes.c
    ${7z_dir}/C/Threads.c
    ${7z_dir}/C/Xz.c
    ${7z_dir}/C/XzCrc64.c
    ${7z_dir}/C/XzCrc64Opt.c
    ${7z_dir}/C/XzDec.c
    ${7z_dir}/C/XzEnc.c
    ${7z_dir}/C/XzIn.c
)
