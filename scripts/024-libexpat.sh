#!/bin/sh -e
# libexpat https://github.com/libexpat/libexpat
VERSION=R_2_2_4

wget --continue https://github.com/libexpat/libexpat/archive/${VERSION}.tar.gz

rm -Rf libexpat-${VERSION} && tar xvzf ${VERSION}.tar.gz
cd libexpat-${VERSION}/expat

./buildconf.sh

## Configure
./configure --prefix="$PS3DEV/portlibs/ppu" --host=powerpc64-ps3-elf --enable-static --disable-shared --without-xmlwf

## Compile and install.
${MAKE:-make} && ${MAKE:-make} install

