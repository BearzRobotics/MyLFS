#!/usr/bin/env bash
# Xz Stage 6
# ~~~~~~~~~~
set -e

cd /sources

eval "$(grep XZ $PACKAGE_LIST)"
PKG_XZ=$(basename $PKG_XZ)

tar -xf $PKG_XZ
cd ${PKG_XZ%.tar*}

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/${PKG_XZ%.tar*}

make
make check
make install

cd /sources
rm -rf ${PKG_XZ%.tar*}

