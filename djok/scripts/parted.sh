./configure --prefix=/usr --disable-static &&
make &&

make -C doc html                                       &&
makeinfo --html      -o doc/html       doc/parted.texi &&
makeinfo --plaintext -o doc/parted.txt doc/parted.texi

make install &&
install -v -m755 -d /usr/share/doc/parted-3.6/html &&
install -v -m644    doc/html/* \
                    /usr/share/doc/parted-3.6/html &&
install -v -m644    doc/{FAT,API,parted.{txt,html}} \
                    /usr/share/doc/parted-3.6