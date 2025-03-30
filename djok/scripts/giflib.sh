wget https://www.linuxfromscratch.org/patches/blfs/12.3/giflib-5.2.2-upstream_fixes-1.patch

patch -Np1 -i giflib-5.2.2-upstream_fixes-1.patch

cp pic/gifgrid.gif doc/giflib-logo.gif

make

make PREFIX=/usr install &&

rm -fv /usr/lib/libgif.a &&

find doc \( -name Makefile\* -o -name \*.1 \
         -o -name \*.xml \) -exec rm -v {} \; &&

install -v -dm755 /usr/share/doc/giflib-5.2.2 &&
cp -v -R doc/* /usr/share/doc/giflib-5.2.2