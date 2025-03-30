wget https://www.linuxfromscratch.org/patches/blfs/12.3/gpm-1.20.7-consolidated-1.patch

cat >> /root/dknotes << "EOF"
gpm
===========================================================
Device Drivers --->
  Input device support --->
    -*-   Generic input layer (needed for keyboard, mouse, ...)          [INPUT]
    <*/M>   Mouse interface                                     [INPUT_MOUSEDEV]

EOF

patch -Np1 -i gpm-1.20.7-consolidated-1.patch                &&
./autogen.sh                                                    &&
./configure --prefix=/usr --sysconfdir=/etc ac_cv_path_emacs=no &&
make


make install                                          &&

install-info --dir-file=/usr/share/info/dir           \
             /usr/share/info/gpm.info                 &&

rm -fv /usr/lib/libgpm.a                              &&
ln -sfv libgpm.so.2.1.0 /usr/lib/libgpm.so            &&
install -v -m644 conf/gpm-root.conf /etc              &&

install -v -m755 -d /usr/share/doc/gpm-1.20.7/support &&
install -v -m644    doc/support/*                     \
                    /usr/share/doc/gpm-1.20.7/support &&
install -v -m644    doc/{FAQ,HACK_GPM,README*}        \
                    /usr/share/doc/gpm-1.20.7