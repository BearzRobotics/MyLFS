# libuv

sh autogen.sh                              &&
./configure --prefix=/usr --disable-static &&
make 

make man -C docs

make install

install -Dm644 docs/build/man/libuv.1 /usr/share/man/man1