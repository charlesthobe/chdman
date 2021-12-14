#!/bin/bash
shopt -s extglob
cd "$(dirname "$0")"
mkdir build
cd build

cp -R ../3rdparty/ .

mkdir -p src/tools
cp ../src/chdman.cpp src/tools/.
cp -R -t src/ ../src/!("chdman.cpp"|"version.cpp")

mkdir -p build/generated
cp ../src/version.cpp build/generated/.

mkdir -p build/1/2/3/4
cp -t build/1/2/3/4 ../make_files/*.make
cp -t build/1/2/3/4 ../make_files/3rdparty/*.make

cd build/1/2/3/4

for mkfile in !("chdman.make"); do make -f "$mkfile" -j$(nproc) config=release64; done

make -f "chdman.make" -j$(nproc) config=release64
