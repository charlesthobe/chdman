#ocore_sdl

#dofile("sdl_cfg.lua")
if(WIN32)
add_compile_definitions(
    UNICODE
    _UNICODE
    _WIN32_WINNT=0x0501
    WIN32_LEAN_AND_MEAN
    NOMINMAX
)
endif()

#This is not currently useful.
set(SDLOS_TARGETOS "unix")
if(WIN32)
    set(SDLOS_TARGETOS "win32")
elseif(APPLE)
    set(SDLOS_TARGETOS "macosx")
endif()

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
${CMAKE_SOURCE_DIR}/src/osd/modules/lib/osd_getenv.cpp #instead of osdlib_${SDLOS_TARGETOS}.cpp
${CMAKE_SOURCE_DIR}/src/osd/modules/lib/osdlib.h
)

if(UNIX)
target_sources(ocore_sdl PRIVATE
    ${CMAKE_SOURCE_DIR}/src/osd/modules/file/posixdir.cpp
    ${CMAKE_SOURCE_DIR}/src/osd/modules/file/posixfile.cpp
    ${CMAKE_SOURCE_DIR}/src/osd/modules/file/posixfile.h
    ${CMAKE_SOURCE_DIR}/src/osd/modules/file/posixptty.cpp
    ${CMAKE_SOURCE_DIR}/src/osd/modules/file/posixsocket.cpp
)
elseif(WIN32)
include_directories(
    ${CMAKE_SOURCE_DIR}/src/osd/windows
)
target_sources(ocore_sdl PRIVATE
    ${CMAKE_SOURCE_DIR}/src/osd/modules/file/windir.cpp
    ${CMAKE_SOURCE_DIR}/src/osd/modules/file/winfile.cpp
    ${CMAKE_SOURCE_DIR}/src/osd/modules/file/winfile.h
    ${CMAKE_SOURCE_DIR}/src/osd/modules/file/winptty.cpp
    ${CMAKE_SOURCE_DIR}/src/osd/modules/file/winsocket.cpp
    ${CMAKE_SOURCE_DIR}/src/osd/windows/winutil.cpp
)
else()
target_sources(ocore_sdl PRIVATE
    ${CMAKE_SOURCE_DIR}/src/osd/modules/file/stdfile.cpp
)
endif()
