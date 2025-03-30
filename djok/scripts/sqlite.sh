wget https://sqlite.org/2025/sqlite-doc-3490100.zip

unzip -q sqlite-doc-3490100.zip

./configure --prefix=/usr     \
            --disable-static  \
            --enable-fts{4,5} \
            CPPFLAGS="-D SQLITE_ENABLE_COLUMN_METADATA=1 \
                      -D SQLITE_ENABLE_UNLOCK_NOTIFY=1   \
                      -D SQLITE_ENABLE_DBSTAT_VTAB=1     \
                      -D SQLITE_SECURE_DELETE=1"         &&
make

make install

install -v -m755 -d /usr/share/doc/sqlite-3.49.1 &&
cp -v -R sqlite-doc-3490100/* /usr/share/doc/sqlite-3.49.1