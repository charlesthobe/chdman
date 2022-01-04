#ocore_sdl
set(CMAKE_CXX_STANDARD 17)
include_directories(
${CMAKE_SOURCE_DIR}/src/emu
${CMAKE_SOURCE_DIR}/src/osd
${CMAKE_SOURCE_DIR}/src/lib
${CMAKE_SOURCE_DIR}/src/lib/util
#${CMAKE_SOURCE_DIR}/src/osd/sdl
)

add_library(ocore_sdl STATIC
${CMAKE_SOURCE_DIR}/src/osd/osdcore.cpp
${CMAKE_SOURCE_DIR}/src/osd/osdcore.h
${CMAKE_SOURCE_DIR}/src/osd/osdfile.h
${CMAKE_SOURCE_DIR}/src/osd/strconv.cpp
${CMAKE_SOURCE_DIR}/src/osd/strconv.h
${CMAKE_SOURCE_DIR}/src/osd/osdsync.cpp
${CMAKE_SOURCE_DIR}/src/osd/osdsync.h
${CMAKE_SOURCE_DIR}/src/osd/modules/osdmodule.cpp
${CMAKE_SOURCE_DIR}/src/osd/modules/osdmodule.h
#${CMAKE_SOURCE_DIR}/src/osd/modules/lib/osdlib_unix.cpp
${CMAKE_SOURCE_DIR}/src/osd/modules/lib/osd_getenv.cpp
${CMAKE_SOURCE_DIR}/src/osd/modules/lib/osdlib.h
${CMAKE_SOURCE_DIR}/src/osd/modules/file/posixdir.cpp
${CMAKE_SOURCE_DIR}/src/osd/modules/file/posixfile.cpp
${CMAKE_SOURCE_DIR}/src/osd/modules/file/posixfile.h
${CMAKE_SOURCE_DIR}/src/osd/modules/file/posixptty.cpp
${CMAKE_SOURCE_DIR}/src/osd/modules/file/posixsocket.cpp
#${CMAKE_SOURCE_DIR}/src/osd/modules/file/stdfile.cpp
)
