# GNU Make project makefile autogenerated by GENie
ifndef config
  config=debug32
endif

ifndef verbose
  SILENT = @
endif

SHELLTYPE := msdos
ifeq (,$(ComSpec)$(COMSPEC))
  SHELLTYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(SHELL)))
  SHELLTYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(MAKESHELL)))
  SHELLTYPE := posix
endif

ifeq (posix,$(SHELLTYPE))
  MKDIR = $(SILENT) mkdir -p "$(1)"
  COPY  = $(SILENT) cp -fR "$(1)" "$(2)"
  RM    = $(SILENT) rm -f "$(1)"
else
  MKDIR = $(SILENT) mkdir "$(subst /,\\,$(1))" 2> nul || exit 0
  COPY  = $(SILENT) copy /Y "$(subst /,\\,$(1))" "$(subst /,\\,$(2))"
  RM    = $(SILENT) del /F "$(subst /,\\,$(1))" 2> nul || exit 0
endif

CC  = gcc
CXX = g++
AR  = ar

ifndef RESCOMP
  ifdef WINDRES
    RESCOMP = $(WINDRES)
  else
    RESCOMP = windres
  endif
endif

ifeq ($(config),debug32)
  OBJDIR              = ../../../../linux_gcc/obj/x32/Debug
  TARGETDIR           = ../../../../linux_gcc/bin/x32/Debug
  override TARGET              = $(TARGETDIR)/libutf8proc.a
  DEFINES            += -DMAME_DEBUG -DMAME_PROFILER -DCRLF=2 -DLSB_FIRST -DFLAC__NO_DLL -DPUGIXML_HEADER_ONLY -DNATIVE_DRC=drcbe_x86 -DLUA_COMPAT_ALL -DLUA_COMPAT_5_1 -DLUA_COMPAT_5_2 -DUTF8PROC_STATIC -Dverbose=-1
  ALL_CPPFLAGS       += $(CPPFLAGS) -MMD -MP -MP $(DEFINES) $(INCLUDES)
  ALL_ASMFLAGS       += $(ASMFLAGS) $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -m32 -pipe -Werror -O3 -fno-strict-aliasing -Wno-unknown-pragmas -Wall -Wcast-align -Wformat-security -Wundef -Wwrite-strings -Wno-conversion -Wno-sign-compare -Wno-error=deprecated-declarations -Wno-unused-result -Wno-array-bounds -Wno-error=attributes -Wno-format-overflow -Wno-stringop-truncation -Wno-stringop-overflow -Wno-return-local-addr -m32
  ALL_CFLAGS         += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -m32 -pipe -Werror -O3 -fno-strict-aliasing -Wno-unknown-pragmas -Wall -Wcast-align -Wformat-security -Wundef -Wwrite-strings -Wno-conversion -Wno-sign-compare -Wno-error=deprecated-declarations -Wno-unused-result -Wno-array-bounds -Wno-error=attributes -Wno-format-overflow -Wno-stringop-truncation -Wno-stringop-overflow -Wno-return-local-addr -m32 -std=gnu99 -Wpointer-arith -Wstrict-prototypes -Wbad-function-cast -Wno-strict-prototypes
  ALL_CXXFLAGS       += $(CXXFLAGS) $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -m32 -std=c++17 -pipe -Werror -O3 -fno-strict-aliasing -Wno-unknown-pragmas -Wall -Wcast-align -Wformat-security -Wundef -Wwrite-strings -Wno-conversion -Wno-sign-compare -Wno-error=deprecated-declarations -Wno-unused-result -Wno-array-bounds -Wno-error=attributes -Wno-format-overflow -Wno-stringop-truncation -Wno-stringop-overflow -Wno-return-local-addr -m32 -std=c++17 -Woverloaded-virtual -Wimplicit-fallthrough -Wno-class-memaccess
  ALL_OBJCFLAGS      += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -m32 -pipe -Werror -O3 -fno-strict-aliasing -Wno-unknown-pragmas -Wall -Wcast-align -Wformat-security -Wundef -Wwrite-strings -Wno-conversion -Wno-sign-compare -Wno-error=deprecated-declarations -Wno-unused-result -Wno-array-bounds -Wno-error=attributes -Wno-format-overflow -Wno-stringop-truncation -Wno-stringop-overflow -Wno-return-local-addr -m32
  ALL_OBJCPPFLAGS    += $(CXXFLAGS) $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -m32 -std=c++17 -pipe -Werror -O3 -fno-strict-aliasing -Wno-unknown-pragmas -Wall -Wcast-align -Wformat-security -Wundef -Wwrite-strings -Wno-conversion -Wno-sign-compare -Wno-error=deprecated-declarations -Wno-unused-result -Wno-array-bounds -Wno-error=attributes -Wno-format-overflow -Wno-stringop-truncation -Wno-stringop-overflow -Wno-return-local-addr -m32 -std=c++17 -Wpointer-arith -Wimplicit-fallthrough
  ALL_RESFLAGS       += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS        += $(LDFLAGS) -L"../../../../../../../../../usr/X11/lib" -L"../../../../../../../../../usr/X11R6/lib" -L"../../../../../../../../../usr/openwin/lib" -L"." -s -m32
  LIBDEPS            +=
  LDDEPS             +=
  LDRESP              =
  LIBS               += $(LDDEPS) -ldl -lrt -lSDL2 -lm -lpthread -lutil
  EXTERNAL_LIBS      +=
  LINKOBJS            = $(OBJECTS)
  LINKCMD             = $(AR)  -rcs $(TARGET)
  OBJRESP             =
  OBJECTS := \
	$(OBJDIR)/3rdparty/utf8proc/utf8proc.o \

  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release32)
  OBJDIR              = ../../../../linux_gcc/obj/x32/Release
  TARGETDIR           = ../../../../linux_gcc/bin/x32/Release
  override TARGET              = $(TARGETDIR)/libutf8proc.a
  DEFINES            += -DNDEBUG -DCRLF=2 -DLSB_FIRST -DFLAC__NO_DLL -DPUGIXML_HEADER_ONLY -DNATIVE_DRC=drcbe_x86 -DLUA_COMPAT_ALL -DLUA_COMPAT_5_1 -DLUA_COMPAT_5_2 -DUTF8PROC_STATIC
  ALL_CPPFLAGS       += $(CPPFLAGS) -MMD -MP -MP $(DEFINES) $(INCLUDES)
  ALL_ASMFLAGS       += $(ASMFLAGS) $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -m32 -pipe -Werror -O3 -fno-strict-aliasing -Wno-unknown-pragmas -Wall -Wcast-align -Wformat-security -Wundef -Wwrite-strings -Wno-conversion -Wno-sign-compare -Wno-error=deprecated-declarations -Wno-unused-result -Wno-array-bounds -Wno-error=attributes -Wno-format-overflow -Wno-stringop-truncation -Wno-stringop-overflow -Wno-return-local-addr -m32
  ALL_CFLAGS         += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -m32 -pipe -Werror -O3 -fno-strict-aliasing -Wno-unknown-pragmas -Wall -Wcast-align -Wformat-security -Wundef -Wwrite-strings -Wno-conversion -Wno-sign-compare -Wno-error=deprecated-declarations -Wno-unused-result -Wno-array-bounds -Wno-error=attributes -Wno-format-overflow -Wno-stringop-truncation -Wno-stringop-overflow -Wno-return-local-addr -m32 -std=gnu99 -Wpointer-arith -Wstrict-prototypes -Wbad-function-cast -Wno-strict-prototypes
  ALL_CXXFLAGS       += $(CXXFLAGS) $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -m32 -std=c++17 -pipe -Werror -O3 -fno-strict-aliasing -Wno-unknown-pragmas -Wall -Wcast-align -Wformat-security -Wundef -Wwrite-strings -Wno-conversion -Wno-sign-compare -Wno-error=deprecated-declarations -Wno-unused-result -Wno-array-bounds -Wno-error=attributes -Wno-format-overflow -Wno-stringop-truncation -Wno-stringop-overflow -Wno-return-local-addr -m32 -std=c++17 -Woverloaded-virtual -Wimplicit-fallthrough -Wno-class-memaccess
  ALL_OBJCFLAGS      += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -m32 -pipe -Werror -O3 -fno-strict-aliasing -Wno-unknown-pragmas -Wall -Wcast-align -Wformat-security -Wundef -Wwrite-strings -Wno-conversion -Wno-sign-compare -Wno-error=deprecated-declarations -Wno-unused-result -Wno-array-bounds -Wno-error=attributes -Wno-format-overflow -Wno-stringop-truncation -Wno-stringop-overflow -Wno-return-local-addr -m32
  ALL_OBJCPPFLAGS    += $(CXXFLAGS) $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -m32 -std=c++17 -pipe -Werror -O3 -fno-strict-aliasing -Wno-unknown-pragmas -Wall -Wcast-align -Wformat-security -Wundef -Wwrite-strings -Wno-conversion -Wno-sign-compare -Wno-error=deprecated-declarations -Wno-unused-result -Wno-array-bounds -Wno-error=attributes -Wno-format-overflow -Wno-stringop-truncation -Wno-stringop-overflow -Wno-return-local-addr -m32 -std=c++17 -Wpointer-arith -Wimplicit-fallthrough
  ALL_RESFLAGS       += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS        += $(LDFLAGS) -L"../../../../../../../../../usr/X11/lib" -L"../../../../../../../../../usr/X11R6/lib" -L"../../../../../../../../../usr/openwin/lib" -L"." -s -m32
  LIBDEPS            +=
  LDDEPS             +=
  LDRESP              =
  LIBS               += $(LDDEPS) -ldl -lrt -lSDL2 -lm -lpthread -lutil
  EXTERNAL_LIBS      +=
  LINKOBJS            = $(OBJECTS)
  LINKCMD             = $(AR)  -rcs $(TARGET)
  OBJRESP             =
  OBJECTS := \
	$(OBJDIR)/3rdparty/utf8proc/utf8proc.o \

  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),debug64)
  OBJDIR              = ../../../../linux_gcc/obj/x64/Debug
  TARGETDIR           = ../../../../linux_gcc/bin/x64/Debug
  override TARGET              = $(TARGETDIR)/libutf8proc.a
  DEFINES            += -DPTR64=1 -DMAME_DEBUG -DMAME_PROFILER -DCRLF=2 -DLSB_FIRST -DFLAC__NO_DLL -DPUGIXML_HEADER_ONLY -DNATIVE_DRC=drcbe_x64 -DLUA_COMPAT_ALL -DLUA_COMPAT_5_1 -DLUA_COMPAT_5_2 -DUTF8PROC_STATIC -Dverbose=-1
  ALL_CPPFLAGS       += $(CPPFLAGS) -MMD -MP -MP $(DEFINES) $(INCLUDES)
  ALL_ASMFLAGS       += $(ASMFLAGS) $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -m64 -pipe -Werror -O3 -fno-strict-aliasing -Wno-unknown-pragmas -Wall -Wcast-align -Wformat-security -Wundef -Wwrite-strings -Wno-conversion -Wno-sign-compare -Wno-error=deprecated-declarations -Wno-unused-result -Wno-array-bounds -Wno-error=attributes -Wno-format-overflow -Wno-stringop-truncation -Wno-stringop-overflow -Wno-return-local-addr -m64
  ALL_CFLAGS         += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -m64 -pipe -Werror -O3 -fno-strict-aliasing -Wno-unknown-pragmas -Wall -Wcast-align -Wformat-security -Wundef -Wwrite-strings -Wno-conversion -Wno-sign-compare -Wno-error=deprecated-declarations -Wno-unused-result -Wno-array-bounds -Wno-error=attributes -Wno-format-overflow -Wno-stringop-truncation -Wno-stringop-overflow -Wno-return-local-addr -m64 -std=gnu99 -Wpointer-arith -Wstrict-prototypes -Wbad-function-cast -Wno-strict-prototypes
  ALL_CXXFLAGS       += $(CXXFLAGS) $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -m64 -std=c++17 -pipe -Werror -O3 -fno-strict-aliasing -Wno-unknown-pragmas -Wall -Wcast-align -Wformat-security -Wundef -Wwrite-strings -Wno-conversion -Wno-sign-compare -Wno-error=deprecated-declarations -Wno-unused-result -Wno-array-bounds -Wno-error=attributes -Wno-format-overflow -Wno-stringop-truncation -Wno-stringop-overflow -Wno-return-local-addr -m64 -std=c++17 -Woverloaded-virtual -Wimplicit-fallthrough -Wno-class-memaccess
  ALL_OBJCFLAGS      += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -m64 -pipe -Werror -O3 -fno-strict-aliasing -Wno-unknown-pragmas -Wall -Wcast-align -Wformat-security -Wundef -Wwrite-strings -Wno-conversion -Wno-sign-compare -Wno-error=deprecated-declarations -Wno-unused-result -Wno-array-bounds -Wno-error=attributes -Wno-format-overflow -Wno-stringop-truncation -Wno-stringop-overflow -Wno-return-local-addr -m64
  ALL_OBJCPPFLAGS    += $(CXXFLAGS) $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -m64 -std=c++17 -pipe -Werror -O3 -fno-strict-aliasing -Wno-unknown-pragmas -Wall -Wcast-align -Wformat-security -Wundef -Wwrite-strings -Wno-conversion -Wno-sign-compare -Wno-error=deprecated-declarations -Wno-unused-result -Wno-array-bounds -Wno-error=attributes -Wno-format-overflow -Wno-stringop-truncation -Wno-stringop-overflow -Wno-return-local-addr -m64 -std=c++17 -Wpointer-arith -Wimplicit-fallthrough
  ALL_RESFLAGS       += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS        += $(LDFLAGS) -L"../../../../../../../../../usr/X11/lib" -L"../../../../../../../../../usr/X11R6/lib" -L"../../../../../../../../../usr/openwin/lib" -L"." -s -m64
  LIBDEPS            +=
  LDDEPS             +=
  LDRESP              =
  LIBS               += $(LDDEPS) -ldl -lrt -lSDL2 -lm -lpthread -lutil
  EXTERNAL_LIBS      +=
  LINKOBJS            = $(OBJECTS)
  LINKCMD             = $(AR)  -rcs $(TARGET)
  OBJRESP             =
  OBJECTS := \
	$(OBJDIR)/3rdparty/utf8proc/utf8proc.o \

  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release64)
  OBJDIR              = ../../../../linux_gcc/obj/x64/Release
  TARGETDIR           = ../../../../linux_gcc/bin/x64/Release
  override TARGET              = $(TARGETDIR)/libutf8proc.a
  DEFINES            += -DPTR64=1 -DNDEBUG -DCRLF=2 -DLSB_FIRST -DFLAC__NO_DLL -DPUGIXML_HEADER_ONLY -DNATIVE_DRC=drcbe_x64 -DLUA_COMPAT_ALL -DLUA_COMPAT_5_1 -DLUA_COMPAT_5_2 -DUTF8PROC_STATIC
  ALL_CPPFLAGS       += $(CPPFLAGS) -MMD -MP -MP $(DEFINES) $(INCLUDES)
  ALL_ASMFLAGS       += $(ASMFLAGS) $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -m64 -pipe -Werror -O3 -fno-strict-aliasing -Wno-unknown-pragmas -Wall -Wcast-align -Wformat-security -Wundef -Wwrite-strings -Wno-conversion -Wno-sign-compare -Wno-error=deprecated-declarations -Wno-unused-result -Wno-array-bounds -Wno-error=attributes -Wno-format-overflow -Wno-stringop-truncation -Wno-stringop-overflow -Wno-return-local-addr -m64
  ALL_CFLAGS         += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -m64 -pipe -Werror -O3 -fno-strict-aliasing -Wno-unknown-pragmas -Wall -Wcast-align -Wformat-security -Wundef -Wwrite-strings -Wno-conversion -Wno-sign-compare -Wno-error=deprecated-declarations -Wno-unused-result -Wno-array-bounds -Wno-error=attributes -Wno-format-overflow -Wno-stringop-truncation -Wno-stringop-overflow -Wno-return-local-addr -m64 -std=gnu99 -Wpointer-arith -Wstrict-prototypes -Wbad-function-cast -Wno-strict-prototypes
  ALL_CXXFLAGS       += $(CXXFLAGS) $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -m64 -std=c++17 -pipe -Werror -O3 -fno-strict-aliasing -Wno-unknown-pragmas -Wall -Wcast-align -Wformat-security -Wundef -Wwrite-strings -Wno-conversion -Wno-sign-compare -Wno-error=deprecated-declarations -Wno-unused-result -Wno-array-bounds -Wno-error=attributes -Wno-format-overflow -Wno-stringop-truncation -Wno-stringop-overflow -Wno-return-local-addr -m64 -std=c++17 -Woverloaded-virtual -Wimplicit-fallthrough -Wno-class-memaccess
  ALL_OBJCFLAGS      += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -m64 -pipe -Werror -O3 -fno-strict-aliasing -Wno-unknown-pragmas -Wall -Wcast-align -Wformat-security -Wundef -Wwrite-strings -Wno-conversion -Wno-sign-compare -Wno-error=deprecated-declarations -Wno-unused-result -Wno-array-bounds -Wno-error=attributes -Wno-format-overflow -Wno-stringop-truncation -Wno-stringop-overflow -Wno-return-local-addr -m64
  ALL_OBJCPPFLAGS    += $(CXXFLAGS) $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -m64 -std=c++17 -pipe -Werror -O3 -fno-strict-aliasing -Wno-unknown-pragmas -Wall -Wcast-align -Wformat-security -Wundef -Wwrite-strings -Wno-conversion -Wno-sign-compare -Wno-error=deprecated-declarations -Wno-unused-result -Wno-array-bounds -Wno-error=attributes -Wno-format-overflow -Wno-stringop-truncation -Wno-stringop-overflow -Wno-return-local-addr -m64 -std=c++17 -Wpointer-arith -Wimplicit-fallthrough
  ALL_RESFLAGS       += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS        += $(LDFLAGS) -L"../../../../../../../../../usr/X11/lib" -L"../../../../../../../../../usr/X11R6/lib" -L"../../../../../../../../../usr/openwin/lib" -L"." -s -m64
  LIBDEPS            +=
  LDDEPS             +=
  LDRESP              =
  LIBS               += $(LDDEPS) -ldl -lrt -lSDL2 -lm -lpthread -lutil
  EXTERNAL_LIBS      +=
  LINKOBJS            = $(OBJECTS)
  LINKCMD             = $(AR)  -rcs $(TARGET)
  OBJRESP             =
  OBJECTS := \
	$(OBJDIR)/3rdparty/utf8proc/utf8proc.o \

  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),debug)
  OBJDIR              = obj/Debug
  TARGETDIR           = ../../../../../scripts/src
  override TARGET              = $(TARGETDIR)/libutf8proc.a
  DEFINES            += -DMAME_DEBUG -DMAME_PROFILER -DCRLF=2 -DLSB_FIRST -DFLAC__NO_DLL -DPUGIXML_HEADER_ONLY -DLUA_COMPAT_ALL -DLUA_COMPAT_5_1 -DLUA_COMPAT_5_2 -DUTF8PROC_STATIC -Dverbose=-1
  ALL_CPPFLAGS       += $(CPPFLAGS) -MMD -MP -MP $(DEFINES) $(INCLUDES)
  ALL_ASMFLAGS       += $(ASMFLAGS) $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -pipe -Werror -O3 -fno-strict-aliasing -Wno-unknown-pragmas -Wall -Wcast-align -Wformat-security -Wundef -Wwrite-strings -Wno-conversion -Wno-sign-compare -Wno-error=deprecated-declarations -Wno-unused-result -Wno-array-bounds -Wno-error=attributes -Wno-format-overflow -Wno-stringop-truncation -Wno-stringop-overflow -Wno-return-local-addr
  ALL_CFLAGS         += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -pipe -Werror -O3 -fno-strict-aliasing -Wno-unknown-pragmas -Wall -Wcast-align -Wformat-security -Wundef -Wwrite-strings -Wno-conversion -Wno-sign-compare -Wno-error=deprecated-declarations -Wno-unused-result -Wno-array-bounds -Wno-error=attributes -Wno-format-overflow -Wno-stringop-truncation -Wno-stringop-overflow -Wno-return-local-addr -std=gnu99 -Wpointer-arith -Wstrict-prototypes -Wbad-function-cast -Wno-strict-prototypes
  ALL_CXXFLAGS       += $(CXXFLAGS) $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -std=c++17 -pipe -Werror -O3 -fno-strict-aliasing -Wno-unknown-pragmas -Wall -Wcast-align -Wformat-security -Wundef -Wwrite-strings -Wno-conversion -Wno-sign-compare -Wno-error=deprecated-declarations -Wno-unused-result -Wno-array-bounds -Wno-error=attributes -Wno-format-overflow -Wno-stringop-truncation -Wno-stringop-overflow -Wno-return-local-addr -std=c++17 -Woverloaded-virtual -Wimplicit-fallthrough -Wno-class-memaccess
  ALL_OBJCFLAGS      += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -pipe -Werror -O3 -fno-strict-aliasing -Wno-unknown-pragmas -Wall -Wcast-align -Wformat-security -Wundef -Wwrite-strings -Wno-conversion -Wno-sign-compare -Wno-error=deprecated-declarations -Wno-unused-result -Wno-array-bounds -Wno-error=attributes -Wno-format-overflow -Wno-stringop-truncation -Wno-stringop-overflow -Wno-return-local-addr
  ALL_OBJCPPFLAGS    += $(CXXFLAGS) $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -std=c++17 -pipe -Werror -O3 -fno-strict-aliasing -Wno-unknown-pragmas -Wall -Wcast-align -Wformat-security -Wundef -Wwrite-strings -Wno-conversion -Wno-sign-compare -Wno-error=deprecated-declarations -Wno-unused-result -Wno-array-bounds -Wno-error=attributes -Wno-format-overflow -Wno-stringop-truncation -Wno-stringop-overflow -Wno-return-local-addr -std=c++17 -Wpointer-arith -Wimplicit-fallthrough
  ALL_RESFLAGS       += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS        += $(LDFLAGS) -L"../../../../../../../../../usr/X11/lib" -L"../../../../../../../../../usr/X11R6/lib" -L"../../../../../../../../../usr/openwin/lib" -L"." -s
  LIBDEPS            +=
  LDDEPS             +=
  LDRESP              =
  LIBS               += $(LDDEPS) -ldl -lrt -lSDL2 -lm -lpthread -lutil
  EXTERNAL_LIBS      +=
  LINKOBJS            = $(OBJECTS)
  LINKCMD             = $(AR)  -rcs $(TARGET)
  OBJRESP             =
  OBJECTS := \
	$(OBJDIR)/3rdparty/utf8proc/utf8proc.o \

  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release)
  OBJDIR              = obj/Release
  TARGETDIR           = ../../../../../scripts/src
  override TARGET              = $(TARGETDIR)/libutf8proc.a
  DEFINES            += -DNDEBUG -DCRLF=2 -DLSB_FIRST -DFLAC__NO_DLL -DPUGIXML_HEADER_ONLY -DLUA_COMPAT_ALL -DLUA_COMPAT_5_1 -DLUA_COMPAT_5_2 -DUTF8PROC_STATIC
  ALL_CPPFLAGS       += $(CPPFLAGS) -MMD -MP -MP $(DEFINES) $(INCLUDES)
  ALL_ASMFLAGS       += $(ASMFLAGS) $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -pipe -Werror -O3 -fno-strict-aliasing -Wno-unknown-pragmas -Wall -Wcast-align -Wformat-security -Wundef -Wwrite-strings -Wno-conversion -Wno-sign-compare -Wno-error=deprecated-declarations -Wno-unused-result -Wno-array-bounds -Wno-error=attributes -Wno-format-overflow -Wno-stringop-truncation -Wno-stringop-overflow -Wno-return-local-addr
  ALL_CFLAGS         += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -pipe -Werror -O3 -fno-strict-aliasing -Wno-unknown-pragmas -Wall -Wcast-align -Wformat-security -Wundef -Wwrite-strings -Wno-conversion -Wno-sign-compare -Wno-error=deprecated-declarations -Wno-unused-result -Wno-array-bounds -Wno-error=attributes -Wno-format-overflow -Wno-stringop-truncation -Wno-stringop-overflow -Wno-return-local-addr -std=gnu99 -Wpointer-arith -Wstrict-prototypes -Wbad-function-cast -Wno-strict-prototypes
  ALL_CXXFLAGS       += $(CXXFLAGS) $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -std=c++17 -pipe -Werror -O3 -fno-strict-aliasing -Wno-unknown-pragmas -Wall -Wcast-align -Wformat-security -Wundef -Wwrite-strings -Wno-conversion -Wno-sign-compare -Wno-error=deprecated-declarations -Wno-unused-result -Wno-array-bounds -Wno-error=attributes -Wno-format-overflow -Wno-stringop-truncation -Wno-stringop-overflow -Wno-return-local-addr -std=c++17 -Woverloaded-virtual -Wimplicit-fallthrough -Wno-class-memaccess
  ALL_OBJCFLAGS      += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -pipe -Werror -O3 -fno-strict-aliasing -Wno-unknown-pragmas -Wall -Wcast-align -Wformat-security -Wundef -Wwrite-strings -Wno-conversion -Wno-sign-compare -Wno-error=deprecated-declarations -Wno-unused-result -Wno-array-bounds -Wno-error=attributes -Wno-format-overflow -Wno-stringop-truncation -Wno-stringop-overflow -Wno-return-local-addr
  ALL_OBJCPPFLAGS    += $(CXXFLAGS) $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -std=c++17 -pipe -Werror -O3 -fno-strict-aliasing -Wno-unknown-pragmas -Wall -Wcast-align -Wformat-security -Wundef -Wwrite-strings -Wno-conversion -Wno-sign-compare -Wno-error=deprecated-declarations -Wno-unused-result -Wno-array-bounds -Wno-error=attributes -Wno-format-overflow -Wno-stringop-truncation -Wno-stringop-overflow -Wno-return-local-addr -std=c++17 -Wpointer-arith -Wimplicit-fallthrough
  ALL_RESFLAGS       += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS        += $(LDFLAGS) -L"../../../../../../../../../usr/X11/lib" -L"../../../../../../../../../usr/X11R6/lib" -L"../../../../../../../../../usr/openwin/lib" -L"." -s
  LIBDEPS            +=
  LDDEPS             +=
  LDRESP              =
  LIBS               += $(LDDEPS) -ldl -lrt -lSDL2 -lm -lpthread -lutil
  EXTERNAL_LIBS      +=
  LINKOBJS            = $(OBJECTS)
  LINKCMD             = $(AR)  -rcs $(TARGET)
  OBJRESP             =
  OBJECTS := \
	$(OBJDIR)/3rdparty/utf8proc/utf8proc.o \

  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

OBJDIRS := \
	$(OBJDIR) \
	$(OBJDIR)/3rdparty/utf8proc \

RESOURCES := \

.PHONY: clean prebuild prelink

all: $(OBJDIRS) $(TARGETDIR) prebuild prelink $(TARGET)
	@:

$(TARGET): $(GCH) $(OBJECTS) $(LIBDEPS) $(EXTERNAL_LIBS) $(RESOURCES) $(OBJRESP) $(LDRESP) | $(TARGETDIR) $(OBJDIRS)
	@echo Archiving $(notdir $@)...
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
endif
	$(SILENT) $(LINKCMD) $(LINKOBJS)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
	-$(call MKDIR,$(TARGETDIR))

$(OBJDIRS):
	-$(call MKDIR,$@)

clean:
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild:
	$(PREBUILDCMDS)

prelink:
	$(PRELINKCMDS)

ifneq (,$(PCH))
$(GCH): $(PCH) $(MAKEFILE) | $(OBJDIR)
	@echo Precompiling $(subst ../,,$<)...
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) -x c++-header $(DEFINES) $(INCLUDES) -o "$@" -c "$<"

$(GCH_OBJC): $(PCH) $(MAKEFILE) | $(OBJDIR)
	@echo Precompiling $(subst ../,,$<)...
	$(SILENT) $(CXX) $(ALL_OBJCPPFLAGS) -x objective-c++-header $(DEFINES) $(INCLUDES) -o "$@" -c "$<"
endif

ifneq (,$(OBJRESP))
$(OBJRESP): $(OBJECTS) | $(TARGETDIR) $(OBJDIRS)
	$(SILENT) echo $^
	$(SILENT) echo $^ > $@
endif

ifneq (,$(LDRESP))
$(LDRESP): $(LDDEPS) | $(TARGETDIR) $(OBJDIRS)
	$(SILENT) echo $^
	$(SILENT) echo $^ > $@
endif

$(OBJDIR)/3rdparty/utf8proc/utf8proc.o: ../../../../../3rdparty/utf8proc/utf8proc.c $(GCH) $(MAKEFILE) | $(OBJDIR)/3rdparty/utf8proc
	@echo Compiling $(subst ../,,$<)...
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -c "$<"

-include $(OBJECTS:%.o=%.d)
ifneq (,$(PCH))
  -include $(OBJDIR)/$(notdir $(PCH)).d
  -include $(OBJDIR)/$(notdir $(PCH))_objc.d
endif
