
./configure --prefix=/usr           \
            --sysconfdir=/etc       \
            --disable-static        \
            --with-history          \
            PYTHON=/usr/bin/python3 \
            --docdir=/usr/share/doc/libxml2-2.13.6
make


make install

rm -vf /usr/lib/libxml2.la &&
sed '/libs=/s/xml2.*/xml2"/' -i /usr/bin/xml2-config