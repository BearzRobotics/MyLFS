./configure --prefix=/usr            \
            --enable-compat-symlinks \
            --mandir=/usr/share/man  \
            --docdir=/usr/share/doc/dosfstools-4.2 &&
make

make install


cat >> /root/dknotes << "EOF"
dosfstools - kernel options
===========================================================
dosfstoolsFile systems --->
  DOS/FAT/EXFAT/NT Filesystems --->
    < /*/M> MSDOS fs support                                          [MSDOS_FS]
    <*/M>   VFAT (Windows-95) fs support                               [VFAT_FS]
EOF