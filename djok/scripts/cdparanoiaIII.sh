wget https://www.linuxfromscratch.org/patches/blfs/12.3/cdparanoia-III-10.2-gcc_fixes-1.patch


patch -Np1 -i cdparanoia-III-10.2-gcc_fixes-1.patch &&
./configure --prefix=/usr --mandir=/usr/share/man &&
make -j1

make install &&
chmod -v 755 /usr/lib/libcdda_*.so.0.10.2 &&
rm -fv /usr/lib/libcdda_*.a