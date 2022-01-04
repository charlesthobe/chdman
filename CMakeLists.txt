cmake_minimum_required(VERSION 3.18)
project("chdman CBT edition")
set(build_version "0.238-CBT_edition")
set(vcs_revision "mame0238-326-gf811f531887")

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()

add_subdirectory(cmake_subdirs)

#chdman
add_executable(chdman
${CMAKE_SOURCE_DIR}/src/tools/chdman.cpp
${CMAKE_SOURCE_DIR}/src/version.cpp
)
target_include_directories(chdman PRIVATE
${CMAKE_SOURCE_DIR}/src/osd
${CMAKE_SOURCE_DIR}/src/lib/util
${CMAKE_SOURCE_DIR}/3rdparty
${CMAKE_SOURCE_DIR}/3rdparty/libflac/include
)
set_property(TARGET chdman PROPERTY CXX_STANDARD 17)
target_compile_definitions(chdman PRIVATE
BARE_BUILD_VERSION="${build_version}"
BARE_VCS_REVISION="${vcs_revision}"
)

#linking
#target_link_libraries(ocore_sdl PRIVATE SDL2)

target_link_libraries(chdman PRIVATE utils expat 7z ocore_sdl zlib flac utf8proc
dl rt m pthread util)
