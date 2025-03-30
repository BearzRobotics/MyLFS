./configure --prefix=/usr --mandir=/usr/share/man &&
make

make install &&
install -v -d -m755 /usr/share/doc/links-2.30 &&
install -v -m644 doc/links_cal/* KEYS BRAILLE_HOWTO \
    /usr/share/doc/links-2.30