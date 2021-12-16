#zlib
set(zlib_dir ${CMAKE_SOURCE_DIR}/3rdparty/zlib)

set(CMAKE_C_FLAGS "-Wno-shift-negative-value")
if(${CMAKE_GENERATOR} STREQUAL "Unix Makefiles" OR ${CMAKE_GENERATOR} STREQUAL "Ninja")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-strict-prototypes")
endif()
add_compile_definitions(ZLIB_CONST)

add_library(zlib STATIC
${zlib_dir}/adler32.c
${zlib_dir}/compress.c
${zlib_dir}/crc32.c
${zlib_dir}/deflate.c
${zlib_dir}/inffast.c
${zlib_dir}/inflate.c
${zlib_dir}/infback.c
${zlib_dir}/inftrees.c
${zlib_dir}/trees.c
${zlib_dir}/uncompr.c
${zlib_dir}/zutil.c
)