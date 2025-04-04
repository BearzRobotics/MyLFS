./configure --prefix=/usr --disable-static
make

make install

ln -sfv bsdunzip /usr/bin/unzip
