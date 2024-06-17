# chdman standalone

Can be built on [Termux](https://termux.dev/).

This repository is a fork of [MAME](https://github.com/mamedev/mame/)

for real contributors to the chdman utility, please visit their repository.

## Compilation

### Install dependencies

```
apt update && apt dist-upgrade -y
apt install build-essential git cmake ninja
```

> **Note**
>
> On Debian/Ubuntu, the Ninja package is called `ninja-build` instead of `ninja`.

### Build chdman

```
git clone https://github.com/CharlesThobe/chdman.git
cd chdman
cmake -B build -G Ninja
cmake --build build
```

The `chdman` binary will be in the `build/` directory.

### Install on Termux

After you compile, run:
```
cp build/chdman ~/../usr/bin/.
```

> **Note**
>
> You can copy `CMakeLists.txt`, `cmake_subdirs/`, `src/version.cpp` and
> `src/osd/modules/lib/osd_getenv.cpp` over the MAME source tree and it will
> build.
