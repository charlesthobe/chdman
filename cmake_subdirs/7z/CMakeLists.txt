#lib7z
add_compile_definitions(_7ZIP_PPMD_SUPPPORT _7ZIP_ST)
set(CMAKE_C_FLAGS "-Wno-strict-prototypes -Wno-undef -Wno-misleading-indentation")
set(7z_dir ${CMAKE_SOURCE_DIR}/3rdparty/lzma)

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
${7z_dir}/C/LzFind.c
${7z_dir}/C/Lzma2Dec.c
${7z_dir}/C/Lzma2Enc.c
${7z_dir}/C/Lzma86Dec.c
${7z_dir}/C/Lzma86Enc.c
${7z_dir}/C/LzmaDec.c
${7z_dir}/C/LzmaEnc.c
${7z_dir}/C/Ppmd7.c
${7z_dir}/C/Ppmd7Dec.c
${7z_dir}/C/Ppmd7Enc.c
${7z_dir}/C/Sha256.c
${7z_dir}/C/Sort.c
)
