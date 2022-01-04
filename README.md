# chdman standalone
can be built on termux

### installing building tools.
```
apt update && apt dist-upgrade -y
apt install build-essential git ninja
```

### Building
```
git clone https://github.com/CharlesThobe/chdman.git
cd chdman
mkdir build && cd build
cmake -G Ninja .. && ninja
```

the `chdman` binary will be in the build directory.

Note: You can copy the "CMakeLists.txt" and "src/osd/modules/lib/osd_getenv.cpp" over the MAME source tree and it will build.
