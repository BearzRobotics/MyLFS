# Here were building this for freebasic
# Thus were build ncurses 6 with abi compatiblity 5

./configure \
  --prefix=/usr \
  --libdir=/usr/lib/ncurses5 \
  --with-shared \
  --with-abi-version=5 \
  --without-debug \
  --without-cxx-binding \
  --without-manpages \
  --with-termlib

make
make install

ln -svf /usr/lib/ncurses5/libncurses.so.5 /usr/lib/libncurses.so.5
ln -svf /usr/lib/ncurses5/libtinfo.so.5   /usr/lib/libtinfo.so.5
