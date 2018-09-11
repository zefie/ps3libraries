#!/bin/sh -e
# faad2.sh by dhewg (dhewg@wiibrew.org) / zefie

VERSION="2.8.8"

## Download the source code.
wget --continue http://downloads.sourceforge.net/faac/faad2-${VERSION}.tar.gz

## Unpack the source code.
rm -Rf faad2-${VERSION} && tar xfvz faad2-${VERSION}.tar.gz && cd faad2-${VERSION}

## Create the build directory.
mkdir build-ppu && cd build-ppu

## Configure the build.
CFLAGS="-I$PSL1GHT/ppu/include -I$PS3DEV/portlibs/ppu/include" \
LDFLAGS="-L$PSL1GHT/ppu/lib -L$PS3DEV/portlibs/ppu/lib -lrt -llv2" \
PKG_CONFIG_PATH="$PS3DEV/portlibs/ppu/lib/pkgconfig" \
../configure --prefix="$PS3DEV/portlibs/ppu" --host="powerpc64-ps3-elf" --disable-shared

## Compile and install.
${MAKE:-make} -j4 && ${MAKE:-make} install
