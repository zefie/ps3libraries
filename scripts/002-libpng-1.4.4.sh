#!/bin/sh -e
# libpng-1.4.4.sh by Dan Peori (danpeori@oopo.net)
VERSION=1.4.22
## Download the source code.
wget https://downloads.sourceforge.net/project/libpng/libpng14/${VERSION}/libpng-${VERSION}.tar.gz

## Unpack the source code.
rm -Rf libpng-${VERSION} && tar xfvz libpng-${VERSION}.tar.gz && cd libpng-${VERSION}

## Create the build directory.
mkdir build-ppu && cd build-ppu

## Configure the build.
CFLAGS="-I$PSL1GHT/ppu/include -I$PS3DEV/portlibs/ppu/include" \
LDFLAGS="-L$PSL1GHT/ppu/lib -L$PS3DEV/portlibs/ppu/lib -lrt -llv2" \
PKG_CONFIG_PATH="$PS3DEV/portlibs/ppu/lib/pkgconfig" \
../configure --prefix="$PS3DEV/portlibs/ppu" --host="powerpc64-ps3-elf" --enable-static --disable-shared

## Compile and install.
${MAKE:-make} -j4 && ${MAKE:-make} install
