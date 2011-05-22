#!/bin/sh
# tiff-3.9.4.sh by Jon Limle <jonlimle123@yahoo.com>

## Download the source code.
wget --continue ftp://ftp.remotesensing.org/pub/libtiff/tiff-3.9.4.tar.gz || { exit 1; }

## Unpack the source code.
rm -Rf tiff-3.9.4 && tar xfvz ./tiff-3.9.4.tar.gz && cd tiff-3.9.4 || { exit 1; }

## Patch the source code.
cat ../../patches/tiff-3.9.4-PPU.patch | patch -p1 || { exit 1; }

## Create the build directory.
mkdir build-ppu && cd build-ppu || { exit 1; }

## Configure the build.
CFLAGS="-I$PSL1GHT/ppu/include -I$PS3DEV/portlibs/ppu/include" \
LDFLAGS="-L$PSL1GHT/ppu/lib -L$PS3DEV/portlibs/ppu/lib -lrt -llv2" \
PKG_CONFIG_PATH="$PS3DEV/portlibs/ppu/lib/pkgconfig" \
../configure --prefix="$PS3DEV/portlibs/ppu" --host=ppu --disable-shared \
    	|| { exit 1; }

## Compile and install.
${MAKE:-make} && ${MAKE:-make} install || { exit 1; }