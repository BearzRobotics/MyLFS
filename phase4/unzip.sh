convmv -f cp866 -t koi8-r -r --nosmart --notest \
    </path/to/unzipped/files>

make -f unix/Makefile generic

make prefix=/usr MANDIR=/usr/share/man/man1 \
 -f unix/Makefile install