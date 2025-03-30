

if ! getent group lp > /dev/null; then
    groupadd lp
    useradd -c "Print Service User" -d /var/spool/cups -g lp -s /bin/false -u 9 lp

    groupadd -g 19 lpadmin

    usermod -a -G lpadmin root
fi

./configure --libdir=/usr/lib            \
            --with-rcdir=/tmp/cupsinit   \
            --with-rundir=/run/cups      \
            --with-system-groups=lpadmin \
            --with-docdir=/usr/share/cups/doc-2.4.11 &&
make

sed -i 's#@CUPS_HTMLVIEW@#firefox#' desktop/cups.desktop.in

make install
ln -svnf ../cups/doc-2.4.11 /usr/share/doc/cups-2.4.11

rm -rf /tmp/cupsinit

echo "ServerName /run/cups/cups.sock" > /etc/cups/client.conf



cat >> /root/dknotes << "EOF"
cups
===========================================================
usermod -a -G lpadmin <username>
EOF