./configure --prefix=/usr --disable-static &&
make

make install &&

install -v -m755 -d        /usr/share/doc/libmng-2.0.3 &&
install -v -m644 doc/*.txt /usr/share/doc/libmng-2.0.3

