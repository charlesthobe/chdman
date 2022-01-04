#!/bin/bash
mkdir 3rdparty
rsync -r --delete ../mame/3rdparty/{expat,libflac,lzma,nanosvg,utf8proc,zlib} 3rdparty/
rsync -r --delete ../mame/src/{emu,frontend,lib} src/
rsync -r --delete --exclude="modules/lib/osd_getenv.cpp" ../mame/src/osd src/
mkdir src/tools/
rsync ../mame/src/tools/chdman.cpp src/tools/

