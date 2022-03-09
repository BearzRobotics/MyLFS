#!/usr/bin/env bash
# Libstdc++ Stage 3
# ~~~~~~~~~~~~~~~~~
set -e

cd $LFS/sources

eval "$(grep PKG_GCC $PACKAGE_LIST)"
PKG_GCC=$(basename $PKG_GCC)

tar -xf $PKG_GCC
cd ${PKG_GCC%.tar*}

mkdir build
cd build

../libstdc++-v3/configure           \
    --host=$LFS_TGT                 \
    --build=$(../config.guess)      \
    --prefix=/usr                   \
    --disable-multilib              \
    --disable-nls                   \
    --disable-libstdcxx-pch         \
    --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/11.2.0

make
make DESTDIR=$LFS install

cd $LFS/sources
rm -rf ${PKG_GCC%.tar*}

