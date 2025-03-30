wget https://www.linuxfromscratch.org/patches/blfs/12.3/pm-utils-1.4.1-bugfixes-1.patch

patch -Np1 -i pm-utils-1.4.1-bugfixes-1.patch

./configure --prefix=/usr     \
            --sysconfdir=/etc \
            --docdir=/usr/share/doc/pm-utils-1.4.1 &&
make

make install

cat >> /root/dknotes << "EOF"
PM-utils - kernel options
===========================================================
Power management and ACPI options --->
  [*] Suspend to RAM and standby                                       [SUSPEND]
  [*] Hibernation (aka 'suspend to disk')                          [HIBERNATION]
EOF