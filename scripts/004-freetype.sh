#!/bin/sh -e
# freetype.sh by Dan Peori (danpeori@oopo.net) / zefie

VERSION="2.4.11"

## Download the source code.
wget --continue http://download.savannah.gnu.org/releases/freetype/freetype-${VERSION}.tar.gz

## Unpack the source code.
rm -Rf freetype-${VERSION} && tar xfvz freetype-${VERSION}.tar.gz && cd freetype-${VERSION}

## Create the build directory.
mkdir build-ppu && cd build-ppu

## freetype insists on GNU make
which gmake 1>/dev/null 2>&1 && MAKE=gmake

## Configure the build.
CFLAGS="-I$PSL1GHT/ppu/include -I$PS3DEV/portlibs/ppu/include" \
LDFLAGS="-L$PSL1GHT/ppu/lib -L$PS3DEV/portlibs/ppu/lib -lrt -llv2" \
PKG_CONFIG_PATH="$PS3DEV/portlibs/ppu/lib/pkgconfig" \
GNUMAKE=$MAKE ../configure --prefix="$PS3DEV/portlibs/ppu" --host="powerpc64-ps3-elf" --disable-shared

## Compile and install.
${MAKE:-make} -j4 && ${MAKE:-make} install
