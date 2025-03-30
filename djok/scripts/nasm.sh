wget https://www.nasm.us/pub/nasm/releasebuilds/2.16.03/nasm-2.16.03-xdoc.tar.xz

tar -xf nasm-2.16.03-xdoc.tar.xz --strip-components=1
./configure --prefix=/usr &&
make

make install

install -m755 -d         /usr/share/doc/nasm-2.16.03/html  &&
cp -v doc/html/*.html    /usr/share/doc/nasm-2.16.03/html  &&
cp -v doc/*.{txt,ps,pdf} /usr/share/doc/nasm-2.16.03