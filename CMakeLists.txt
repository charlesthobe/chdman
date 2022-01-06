cmake_minimum_required(VERSION 3.18)
project("chdman CBT edition")
set(build_version "0.238-CBT_edition")
set(vcs_revision "mame0238")
#cd ../mame && git describe --dirty

if(NOT CMAKE_BUILD_TYPE)
set(CMAKE_BUILD_TYPE Release)
endif()

set(CMAKE_CXX_STANDARD 17) #needed by libocore and libutils. -
#set globally to match MAME's genie scripts.

if(WIN32)
add_compile_definitions(
  X64_WINDOWS_ABI
  CRLF=3
)
else()
add_compile_definitions(
  CRLF=2
)
endif()

if(CMAKE_SYSTEM_NAME STREQUAL "FreeBSD")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wbad-function-cast")
endif()

function(addprojectflags)
  if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wsuggest-override -flifetime-dse=1")
  endif()
endfunction()

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

target_link_libraries(chdman PRIVATE utils expat 7z ocore_sdl zlib flac utf8proc
dl rt m pthread util)
