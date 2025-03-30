sed -e 's/set_from_init_file/texinfo_&/' \
    -i Doc/Makefile.in

sed -e 's/^main/int &/'      \
    -e 's/exit(/return(/'    \
    -i aczsh.m4 configure.ac &&

sed -e 's/test = /&(char**)/' \
    -i configure.ac           &&

autoconf

sed -e 's|/etc/z|/etc/zsh/z|g' \
    -i Doc/*.*


./configure --prefix=/usr            \
            --sysconfdir=/etc/zsh    \
            --enable-etcdir=/etc/zsh \
            --enable-cap             \
            --enable-gdbm                      &&
make                                           &&

makeinfo  Doc/zsh.texi --html      -o Doc/html &&
makeinfo  Doc/zsh.texi --plaintext -o zsh.txt  &&
makeinfo  Doc/zsh.texi --html --no-split --no-headers -o zsh.html

make install                                                    &&
make infodir=/usr/share/info install.info                       &&
make htmldir=/usr/share/doc/zsh-5.9/html install.html           &&
install -v -m644 zsh.{html,txt} Etc/FAQ /usr/share/doc/zsh-5.9


cat >> /etc/shells << "EOF"
/bin/zsh
EOF