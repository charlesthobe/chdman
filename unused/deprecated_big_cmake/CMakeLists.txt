cmake_minimum_required(VERSION 3.18)
project("chdman CBT edition")
#compiler flags are "CMAKE_C_FLAGS" and "CMAKE_CXX_FLAGS"
set(project_root ${CMAKE_SOURCE_DIR})

option(BIGENDIAN OFF)

#lib7z
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
target_compile_definitions(7z PRIVATE _7ZIP_PPMD_SUPPPORT _7ZIP_ST)
set_target_properties(7z PROPERTIES
CMAKE_C_FLAGS "-Wno-strict-prototypes -Wno-undef -Wno-misleading-indentation"
)

#libexpat
set(expat_dir ${CMAKE_SOURCE_DIR}/3rdparty/expat)
add_library(expat STATIC
${expat_dir}/lib/xmlparse.c
${expat_dir}/lib/xmlrole.c
${expat_dir}/lib/xmltok.c
)
target_compile_definitions(expat PRIVATE
HAVE_MEMMOVE
HAVE_STDINT_H
HAVE_STDLIB_H
HAVE_STRING_H
PACKAGE=expat
PACKAGE_BUGREPORT="expat-bugs@libexpat.org"
PACKAGE_NAME=expat
PACKAGE_STRING="expat 2.2.10"
PACKAGE_TARNAME=expat
PACKAGE_URL=
PACKAGE_VERSION="2.2.10"
STDC_HEADERS
VERSION="2.2.10"
XML_CONTEXT_BYTES=1024
XML_DTD
XML_NS
)
if(CMAKE_COMPILER_IS_GNUCC AND CMAKE_CXX_COMPILER_VERSION VERSION_GREATER 11.1)
set_target_properties(expat PROPERTIES
CMAKE_C_FLAGS "-Wno-maybe-uninitialized"
)
endif()
if(BIGENDIAN)
target_compile_definitions(expat PRIVATE BYTEORDER=4321 WORDS_BIGENDIAN)
else()
target_compile_definitions(expat PRIVATE BYTEORDER=1234)
endif()
#if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
target_compile_definitions(expat PRIVATE
HAVE_DLFCN_H
HAVE_FCNTL_H
HAVE_MMAP
HAVE_SYS_STAT_H
HAVE_SYS_TYPES_H
HAVE_UNISTD_H
XML_DEV_URANDOM
)
#endif()

#libflac
set(flac_dir ${CMAKE_SOURCE_DIR}/3rdparty/libflac)
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
target_compile_definitions(flac PRIVATE
WORDS_BIGENDIAN=0
FLAC__NO_ASM
_LARGEFILE_SOURCE
_FILE_OFFSET_BITS=64
FLAC__HAS_OGG=0
HAVE_CONFIG_H=1
)
if(${CMAKE_GENERATOR} STREQUAL "Unix Makefiles" OR ${CMAKE_GENERATOR} STREQUAL "Ninja")
set(flac_flags "-Wno-unused-function -O0")
endif()
if(CMAKE_COMPILER_IS_GNUCC OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
set(flac_flags ${flac_flags} "-Wno-enum-conversion")
endif()
set_target_properties(flac PROPERTIES
CMAKE_C_FLAGS "${flac_flags}")
target_include_directories(flac PRIVATE
${flac_dir}/src/libFLAC/include
${flac_dir}/include
)

#utf8proc
set(utf8proc_dir ${CMAKE_SOURCE_DIR}/3rdparty/utf8proc)
add_library(utf8proc STATIC
${utf8proc_dir}/utf8proc.c
)
target_compile_definitions(utf8proc PRIVATE
UTF8PROC_STATIC
)
if(${CMAKE_GENERATOR} STREQUAL "Unix Makefiles" OR ${CMAKE_GENERATOR} STREQUAL "Ninja")
set_target_properties(utf8proc PROPERTIES
CMAKE_C_FLAGS "-Wno-strict-prototypes")
endif()

#zlib
set(zlib_dir ${CMAKE_SOURCE_DIR}/3rdparty/zlib)
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
set(zlib_flags "-Wno-shift-negative-value")
if(${CMAKE_GENERATOR} STREQUAL "Unix Makefiles" OR ${CMAKE_GENERATOR} STREQUAL "Ninja")
set(zlib_flags ${zlib_flags} "-Wno-strict-prototypes")
endif()
set_target_properties(zlib PROPERTIES
CMAKE_C_FLAGS "${zlib_flags}")
target_compile_definitions(zlib PRIVATE
ZLIB_CONST
)

#SDL2
#set(SDL2_dir ${CMAKE_SOURCE_DIR}/3rdparty/SDL2)
#add_library(SDL2 STATIC
#${SDL2_dir}/src/atomic/SDL_atomic.c
#${SDL2_dir}/src/atomic/SDL_spinlock.c
#${SDL2_dir}/src/audio/disk/SDL_diskaudio.c
#${SDL2_dir}/src/audio/disk/SDL_diskaudio.h
#${SDL2_dir}/src/audio/dummy/SDL_dummyaudio.c
#${SDL2_dir}/src/audio/dummy/SDL_dummyaudio.h
#${SDL2_dir}/src/audio/SDL_audio.c
#${SDL2_dir}/src/audio/SDL_audio_c.h
#${SDL2_dir}/src/audio/SDL_audiocvt.c
#${SDL2_dir}/src/audio/SDL_audiodev.c
#${SDL2_dir}/src/audio/SDL_audiodev_c.h
#${SDL2_dir}/src/audio/SDL_audiotypecvt.c
#${SDL2_dir}/src/audio/SDL_mixer.c
#${SDL2_dir}/src/audio/SDL_sysaudio.h
#${SDL2_dir}/src/audio/SDL_wave.c
#${SDL2_dir}/src/audio/SDL_wave.h
#${SDL2_dir}/src/cpuinfo/SDL_cpuinfo.c
#${SDL2_dir}/src/dynapi/SDL_dynapi.c
#${SDL2_dir}/src/dynapi/SDL_dynapi.h
#${SDL2_dir}/src/dynapi/SDL_dynapi_overrides.h
#${SDL2_dir}/src/dynapi/SDL_dynapi_procs.h
#${SDL2_dir}/src/events/blank_cursor.h
#${SDL2_dir}/src/events/default_cursor.h
#${SDL2_dir}/src/events/SDL_clipboardevents.c
#${SDL2_dir}/src/events/SDL_clipboardevents_c.h
#${SDL2_dir}/src/events/SDL_dropevents.c
#${SDL2_dir}/src/events/SDL_dropevents_c.h
#${SDL2_dir}/src/events/SDL_events.c
#${SDL2_dir}/src/events/SDL_events_c.h
#${SDL2_dir}/src/events/SDL_gesture.c
#${SDL2_dir}/src/events/SDL_gesture_c.h
#${SDL2_dir}/src/events/SDL_keyboard.c
#${SDL2_dir}/src/events/SDL_keyboard_c.h
#${SDL2_dir}/src/events/SDL_mouse.c
#${SDL2_dir}/src/events/SDL_mouse_c.h
#${SDL2_dir}/src/events/SDL_quit.c
#${SDL2_dir}/src/events/SDL_sysevents.h
#${SDL2_dir}/src/events/SDL_touch.c
#${SDL2_dir}/src/events/SDL_touch_c.h
#${SDL2_dir}/src/events/SDL_windowevents.c
#${SDL2_dir}/src/events/SDL_windowevents_c.h
#${SDL2_dir}/src/file/SDL_rwops.c
#${SDL2_dir}/src/haptic/SDL_haptic.c
#${SDL2_dir}/src/haptic/SDL_syshaptic.h
#${SDL2_dir}/src/joystick/SDL_gamecontroller.c
#${SDL2_dir}/src/joystick/SDL_joystick.c
#${SDL2_dir}/src/joystick/SDL_joystick_c.h
#${SDL2_dir}/src/joystick/SDL_sysjoystick.h
#${SDL2_dir}/src/loadso/windows/SDL_sysloadso.c
#${SDL2_dir}/src/power/SDL_power.c
#${SDL2_dir}/src/power/windows/SDL_syspower.c
#${SDL2_dir}/src/render/direct3d/SDL_render_d3d.c
#${SDL2_dir}/src/render/direct3d11/SDL_render_d3d11.c
#${SDL2_dir}/src/render/mmx.h
#${SDL2_dir}/src/render/opengl/SDL_render_gl.c
#${SDL2_dir}/src/render/opengl/SDL_shaders_gl.c
#${SDL2_dir}/src/render/opengl/SDL_shaders_gl.h
#${SDL2_dir}/src/render/opengles2/SDL_render_gles2.c
#${SDL2_dir}/src/render/opengles2/SDL_shaders_gles2.c
#${SDL2_dir}/src/render/SDL_d3dmath.c
#${SDL2_dir}/src/render/SDL_d3dmath.h
#${SDL2_dir}/src/render/SDL_render.c
#${SDL2_dir}/src/render/SDL_sysrender.h
#${SDL2_dir}/src/render/SDL_yuv_mmx.c
#${SDL2_dir}/src/render/SDL_yuv_sw.c
#${SDL2_dir}/src/render/SDL_yuv_sw_c.h
#${SDL2_dir}/src/render/software/SDL_blendfillrect.c
#${SDL2_dir}/src/render/software/SDL_blendfillrect.h
#${SDL2_dir}/src/render/software/SDL_blendline.c
#${SDL2_dir}/src/render/software/SDL_blendline.h
#${SDL2_dir}/src/render/software/SDL_blendpoint.c
#${SDL2_dir}/src/render/software/SDL_blendpoint.h
#${SDL2_dir}/src/render/software/SDL_draw.h
#${SDL2_dir}/src/render/software/SDL_drawline.c
#${SDL2_dir}/src/render/software/SDL_drawline.h
#${SDL2_dir}/src/render/software/SDL_drawpoint.c
#${SDL2_dir}/src/render/software/SDL_drawpoint.h
#${SDL2_dir}/src/render/software/SDL_render_sw.c
#${SDL2_dir}/src/render/software/SDL_render_sw_c.h
#${SDL2_dir}/src/render/software/SDL_rotate.c
#${SDL2_dir}/src/render/software/SDL_rotate.h
#${SDL2_dir}/src/SDL.c
#${SDL2_dir}/src/SDL_assert.c
#${SDL2_dir}/src/SDL_error.c
#${SDL2_dir}/src/SDL_error_c.h
#${SDL2_dir}/src/SDL_hints.c
#${SDL2_dir}/src/SDL_log.c
#${SDL2_dir}/src/stdlib/SDL_getenv.c
#${SDL2_dir}/src/stdlib/SDL_iconv.c
#${SDL2_dir}/src/stdlib/SDL_malloc.c
#${SDL2_dir}/src/stdlib/SDL_qsort.c
#${SDL2_dir}/src/stdlib/SDL_stdlib.c
#${SDL2_dir}/src/stdlib/SDL_string.c
#${SDL2_dir}/src/thread/SDL_systhread.h
#${SDL2_dir}/src/thread/SDL_thread.c
#${SDL2_dir}/src/thread/SDL_thread_c.h
#${SDL2_dir}/src/timer/SDL_timer.c
#${SDL2_dir}/src/timer/SDL_timer_c.h
#${SDL2_dir}/src/video/dummy/SDL_nullevents.c
#${SDL2_dir}/src/video/dummy/SDL_nullevents_c.h
#${SDL2_dir}/src/video/dummy/SDL_nullframebuffer.c
#${SDL2_dir}/src/video/dummy/SDL_nullframebuffer_c.h
#${SDL2_dir}/src/video/dummy/SDL_nullvideo.c
#${SDL2_dir}/src/video/dummy/SDL_nullvideo.h
#${SDL2_dir}/src/video/SDL_blit.c
#${SDL2_dir}/src/video/SDL_blit.h
#${SDL2_dir}/src/video/SDL_blit_0.c
#${SDL2_dir}/src/video/SDL_blit_1.c
#${SDL2_dir}/src/video/SDL_blit_A.c
#${SDL2_dir}/src/video/SDL_blit_auto.c
#${SDL2_dir}/src/video/SDL_blit_auto.h
#${SDL2_dir}/src/video/SDL_blit_copy.c
#${SDL2_dir}/src/video/SDL_blit_copy.h
#${SDL2_dir}/src/video/SDL_blit_N.c
#${SDL2_dir}/src/video/SDL_blit_slow.c
#${SDL2_dir}/src/video/SDL_blit_slow.h
#${SDL2_dir}/src/video/SDL_bmp.c
#${SDL2_dir}/src/video/SDL_clipboard.c
#${SDL2_dir}/src/video/SDL_egl.c
#${SDL2_dir}/src/video/SDL_fillrect.c
#${SDL2_dir}/src/video/SDL_pixels.c
#${SDL2_dir}/src/video/SDL_pixels_c.h
#${SDL2_dir}/src/video/SDL_rect.c
#${SDL2_dir}/src/video/SDL_rect_c.h
#${SDL2_dir}/src/video/SDL_RLEaccel.c
#${SDL2_dir}/src/video/SDL_RLEaccel_c.h
#${SDL2_dir}/src/video/SDL_shape.c
#${SDL2_dir}/src/video/SDL_shape_internals.h
#${SDL2_dir}/src/video/SDL_stretch.c
#${SDL2_dir}/src/video/SDL_surface.c
#${SDL2_dir}/src/video/SDL_sysvideo.h
#${SDL2_dir}/src/video/SDL_video.c
#
##${SDL2_dir}/3rdparty/SDL2/src/libm/e_atan2.c
##${SDL2_dir}/3rdparty/SDL2/src/libm/e_log.c
##${SDL2_dir}/3rdparty/SDL2/src/libm/e_pow.c
##${SDL2_dir}/3rdparty/SDL2/src/libm/e_rem_pio2.c
##${SDL2_dir}/3rdparty/SDL2/src/libm/e_sqrt.c
##${SDL2_dir}/3rdparty/SDL2/src/libm/k_cos.c
##${SDL2_dir}/3rdparty/SDL2/src/libm/k_rem_pio2.c
##${SDL2_dir}/3rdparty/SDL2/src/libm/k_sin.c
##${SDL2_dir}/3rdparty/SDL2/src/libm/k_tan.c
##${SDL2_dir}/3rdparty/SDL2/src/libm/math.h
##${SDL2_dir}/3rdparty/SDL2/src/libm/math_private.h
##${SDL2_dir}/3rdparty/SDL2/src/libm/s_atan.c
##${SDL2_dir}/3rdparty/SDL2/src/libm/s_copysign.c
##${SDL2_dir}/3rdparty/SDL2/src/libm/s_cos.c
##${SDL2_dir}/3rdparty/SDL2/src/libm/s_fabs.c
##${SDL2_dir}/3rdparty/SDL2/src/libm/s_floor.c
##${SDL2_dir}/3rdparty/SDL2/src/libm/s_scalbn.c
##${SDL2_dir}/3rdparty/SDL2/src/libm/s_sin.c
##${SDL2_dir}/3rdparty/SDL2/src/libm/s_tan.c
#)
#target_include_directories(SDL2 PRIVATE
#${SDL2_dir}/include
#)
#set_target_properties(SDL2 PROPERTIES
#CMAKE_C_FLAGS "-Wimplicit-function-declaration -Wpointer-to-int-cast")

#ocore_sdl
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
${CMAKE_SOURCE_DIR}/src/osd/modules/lib/osdlib_unix.cpp
${CMAKE_SOURCE_DIR}/src/osd/modules/lib/osdlib.h
${CMAKE_SOURCE_DIR}/src/osd/modules/file/posixdir.cpp
${CMAKE_SOURCE_DIR}/src/osd/modules/file/posixfile.cpp
${CMAKE_SOURCE_DIR}/src/osd/modules/file/posixfile.h
${CMAKE_SOURCE_DIR}/src/osd/modules/file/posixptty.cpp
${CMAKE_SOURCE_DIR}/src/osd/modules/file/posixsocket.cpp
#${CMAKE_SOURCE_DIR}/src/osd/modules/file/stdfile.cpp
)
target_include_directories(ocore_sdl PRIVATE
${CMAKE_SOURCE_DIR}/src/emu
${CMAKE_SOURCE_DIR}/src/osd
${CMAKE_SOURCE_DIR}/src/lib
${CMAKE_SOURCE_DIR}/src/lib/util
${CMAKE_SOURCE_DIR}/src/osd/sdl
)
set_property(TARGET ocore_sdl PROPERTY CXX_STANDARD 17)

#utils
set(utils_dir ${CMAKE_SOURCE_DIR}/src/lib/util)
add_library(utils STATIC
${utils_dir}/abi.h
${utils_dir}/avhuff.cpp
${utils_dir}/avhuff.h
${utils_dir}/aviio.cpp
${utils_dir}/aviio.h
${utils_dir}/base64.hpp
${utils_dir}/bitmap.cpp
${utils_dir}/bitmap.h
${utils_dir}/bitstream.h
${utils_dir}/cdrom.cpp
${utils_dir}/cdrom.h
${utils_dir}/chd.cpp
${utils_dir}/chd.h
${utils_dir}/chdcd.cpp
${utils_dir}/chdcd.h
${utils_dir}/chdcodec.cpp
${utils_dir}/chdcodec.h
${utils_dir}/client_http.hpp
${utils_dir}/client_https.hpp
${utils_dir}/client_ws.hpp
${utils_dir}/client_wss.hpp
${utils_dir}/corealloc.cpp
${utils_dir}/corealloc.h
${utils_dir}/corefile.cpp
${utils_dir}/corefile.h
${utils_dir}/corestr.cpp
${utils_dir}/corestr.h
${utils_dir}/coretmpl.h
${utils_dir}/coreutil.cpp
${utils_dir}/coreutil.h
${utils_dir}/crypto.hpp
${utils_dir}/delegate.cpp
${utils_dir}/delegate.h
${utils_dir}/disasmintf.cpp
${utils_dir}/disasmintf.h
${utils_dir}/dynamicclass.cpp
${utils_dir}/dynamicclass.h
${utils_dir}/dynamicclass.ipp
${utils_dir}/endianness.h
${utils_dir}/flac.cpp
${utils_dir}/flac.h
${utils_dir}/harddisk.cpp
${utils_dir}/harddisk.h
${utils_dir}/hash.cpp
${utils_dir}/hash.h
${utils_dir}/hashing.cpp
${utils_dir}/hashing.h
${utils_dir}/huffman.cpp
${utils_dir}/huffman.h
${utils_dir}/ioprocs.cpp
${utils_dir}/ioprocs.h
${utils_dir}/ioprocsfill.h
${utils_dir}/ioprocsfilter.cpp
${utils_dir}/ioprocsfilter.h
${utils_dir}/ioprocsvec.h
${utils_dir}/jedparse.cpp
${utils_dir}/jedparse.h
${utils_dir}/language.cpp
${utils_dir}/language.h
${utils_dir}/lrucache.h
${utils_dir}/md5.cpp
${utils_dir}/md5.h
${utils_dir}/msdib.cpp
${utils_dir}/msdib.h
${utils_dir}/nanosvg.cpp
${utils_dir}/nanosvg.h
${utils_dir}/opresolv.cpp
${utils_dir}/opresolv.h
${utils_dir}/options.cpp
${utils_dir}/options.h
${utils_dir}/palette.cpp
${utils_dir}/palette.h
${utils_dir}/path.cpp
${utils_dir}/path.h
${utils_dir}/path_to_regex.cpp
${utils_dir}/path_to_regex.hpp
${utils_dir}/plaparse.cpp
${utils_dir}/plaparse.h
${utils_dir}/png.cpp
${utils_dir}/png.h
${utils_dir}/server_http.hpp
${utils_dir}/server_https.hpp
${utils_dir}/server_ws.hpp
${utils_dir}/server_wss.hpp
${utils_dir}/strformat.cpp
${utils_dir}/strformat.h
${utils_dir}/timeconv.cpp
${utils_dir}/timeconv.h
${utils_dir}/unicode.cpp
${utils_dir}/unicode.h
${utils_dir}/unzip.cpp
${utils_dir}/unzip.h
${utils_dir}/un7z.cpp
${utils_dir}/utilfwd.h
${utils_dir}/vbiparse.cpp
${utils_dir}/vbiparse.h
${utils_dir}/vecstream.cpp
${utils_dir}/vecstream.h
${utils_dir}/wavwrite.cpp
${utils_dir}/wavwrite.h
${utils_dir}/xmlfile.cpp
${utils_dir}/xmlfile.h
${utils_dir}/zippath.cpp
${utils_dir}/zippath.h
)
target_compile_definitions(utils PRIVATE UTF8PROC_STATIC)
target_include_directories(utils PRIVATE
${CMAKE_SOURCE_DIR}/src/osd
${CMAKE_SOURCE_DIR}/src/lib/util
${CMAKE_SOURCE_DIR}/3rdparty
${CMAKE_SOURCE_DIR}/3rdparty/expat/lib
${CMAKE_SOURCE_DIR}/3rdparty/zlib
${CMAKE_SOURCE_DIR}/3rdparty/libflac/include
${CMAKE_SOURCE_DIR}/3rdparty/utf8proc
)
set_property(TARGET utils PROPERTY CXX_STANDARD 17)
target_compile_definitions(utils PRIVATE
CRLF=2
)

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
