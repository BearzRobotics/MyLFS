wget https://downloads.sourceforge.net/freetype/freetype-doc-2.13.3.tar.xz

tar -xf freetype-doc-2.13.3.tar.xz --strip-components=2 -C docs

sed -ri "s:.*(AUX_MODULES.*valid):\1:" modules.cfg &&

sed -r "s:.*(#.*SUBPIXEL_RENDERING) .*:\1:" \
    -i include/freetype/config/ftoption.h  &&

./configure --prefix=/usr --enable-freetype-config --disable-static &&
make

make install

cp -v -R docs -T /usr/share/doc/freetype-2.13.3 &&
rm -v /usr/share/doc/freetype-2.13.3/freetype-config.1