#utf8proc
set(utf8proc_dir ${CMAKE_SOURCE_DIR}/3rdparty/utf8proc)
add_compile_definitions(
    UTF8PROC_STATIC
)

if(${CMAKE_GENERATOR} STREQUAL "Unix Makefiles" OR ${CMAKE_GENERATOR} STREQUAL "Ninja")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-strict-prototypes")
endif()

add_library(utf8proc STATIC
    ${utf8proc_dir}/utf8proc.c
)
