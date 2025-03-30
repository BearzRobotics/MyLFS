./configure --prefix=/usr                      \
            --without-javascript               \
            --without-maximum-compile-warnings &&
make


make install
cp -v -R Doc -T /usr/share/doc/swig-4.3.0