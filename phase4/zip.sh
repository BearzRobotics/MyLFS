make -f unix/Makefile generic CC="gcc -std=gnu89"

make prefix=/usr MANDIR=/usr/share/man/man1 -f unix/Makefile install