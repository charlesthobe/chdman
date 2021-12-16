# chdman standalone
can be built on termux

### installing building tools.
```
apt update
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
