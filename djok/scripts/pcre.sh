./configure --prefix=/usr            \
            --enable-utf             \
            --enable-unicode-properties \
            --docdir=/usr/share/doc/pcre-8.45 \
            --enable-pcregrep-libz   \
            --enable-pcregrep-libbz2

make
make install