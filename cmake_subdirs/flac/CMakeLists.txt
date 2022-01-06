#libflac
set(flac_dir ${CMAKE_SOURCE_DIR}/3rdparty/libflac)

add_compile_definitions(
    WORDS_BIGENDIAN=0
    FLAC__NO_ASM
    _LARGEFILE_SOURCE
    _FILE_OFFSET_BITS=64
    FLAC__HAS_OGG=0
    HAVE_CONFIG_H=1
)

if(${CMAKE_GENERATOR} STREQUAL "Unix Makefiles" OR ${CMAKE_GENERATOR} STREQUAL "Ninja")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-unused-function -O0")
endif()

if(CMAKE_C_COMPILER_ID STREQUAL "Clang" OR CMAKE_SYSTEM_NAME STREQUAL "Android")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-enum-conversion")
endif()

if(${CMAKE_SYSTEM_NAME} STREQUAL "Darwin")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-unknown-attributes")
endif()

include_directories(
    ${flac_dir}/src/libFLAC/include
    ${flac_dir}/include
)

add_library(flac STATIC
    ${flac_dir}/src/libFLAC/bitmath.c
    ${flac_dir}/src/libFLAC/bitreader.c
    ${flac_dir}/src/libFLAC/bitwriter.c
    ${flac_dir}/src/libFLAC/cpu.c
    ${flac_dir}/src/libFLAC/crc.c
    ${flac_dir}/src/libFLAC/fixed.c
    ${flac_dir}/src/libFLAC/float.c
    ${flac_dir}/src/libFLAC/format.c
    ${flac_dir}/src/libFLAC/lpc.c
    ${flac_dir}/src/libFLAC/md5.c
    ${flac_dir}/src/libFLAC/memory.c
    ${flac_dir}/src/libFLAC/stream_decoder.c
    ${flac_dir}/src/libFLAC/stream_encoder.c
    ${flac_dir}/src/libFLAC/stream_encoder_framing.c
    ${flac_dir}/src/libFLAC/window.c
)
