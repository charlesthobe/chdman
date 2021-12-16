cmake_minimum_required(VERSION 3.18)
project("chdman CBT edition")
#compiler flags are "CMAKE_C_FLAGS" and "CMAKE_CXX_FLAGS"

add_subdirectory(cmake_subdirs)

#chdman
add_executable(chdman
${CMAKE_SOURCE_DIR}/src/chdman.cpp
${CMAKE_SOURCE_DIR}/src/version.cpp
)
target_include_directories(chdman PRIVATE
${CMAKE_SOURCE_DIR}/src/osd
${CMAKE_SOURCE_DIR}/src/lib/util
${CMAKE_SOURCE_DIR}/3rdparty
${CMAKE_SOURCE_DIR}/3rdparty/libflac/include
)
set_property(TARGET chdman PROPERTY CXX_STANDARD 17)

#linking
#target_link_libraries(ocore_sdl PRIVATE SDL2)

target_link_libraries(chdman PRIVATE utils expat 7z ocore_sdl zlib flac utf8proc
dl rt SDL2 m pthread util)
