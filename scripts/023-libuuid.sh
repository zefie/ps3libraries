#!/bin/sh -e
# libuuid https://sourceforge.net/projects/libuuid/
VERSION=1.0.3

wget --continue https://downloads.sourceforge.net/project/libuuid/libuuid-${VERSION}.tar.gz

rm -Rf libuuid-${VERSION} && mkdir libuuid-${VERSION} && tar xvzf libuuid-${VERSION}.tar.gz
cd libuuid-${VERSION}

## Configure
export CFLAGS="-I$PS3DEV/ppu/powerpc64-ps3-elf/include -I$PS3DEV/spu/spu/include"
./configure --prefix="$PS3DEV/portlibs/ppu" --host="powerpc64-ps3-elf" --enable-static --disable-shared

## Compile and install.
${MAKE:-make} && ${MAKE:-make} install

