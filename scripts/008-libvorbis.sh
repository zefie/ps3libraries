#!/bin/sh -e
# libvorbis.sh by Dan Peori (danpeori@oopo.net) / zefie

VERSION="1.3.6"

## Download the source code.
wget --continue http://downloads.xiph.org/releases/vorbis/libvorbis-${VERSION}.tar.gz

## Unpack the source code.
rm -Rf libvorbis-${VERSION} && tar xfvz libvorbis-${VERSION}.tar.gz && cd libvorbis-${VERSION}

## Create the build directory.
mkdir build-ppu && cd build-ppu

## Configure the build.
CFLAGS="-I$PSL1GHT/ppu/include -I$PS3DEV/portlibs/ppu/include" \
LDFLAGS="-L$PSL1GHT/ppu/lib -L$PS3DEV/portlibs/ppu/lib -lrt -llv2" \
PKG_CONFIG_PATH="$PS3DEV/portlibs/ppu/lib/pkgconfig" \
../configure --prefix="$PS3DEV/portlibs/ppu" --host="powerpc64-ps3-elf" --disable-shared

## Compile and install.
${MAKE:-make} -j4 && ${MAKE:-make} install
