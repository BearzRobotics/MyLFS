wget https://docbook.org/xml/5.0/docbook-5.0.zip
unzip docbook-5.0.zip -d docbook-5.0

install -vdm755 /usr/share/xml/docbook/schema/{dtd,rng,sch,xsd}/5.0
DOCBOOK_DIR=docbook-5.0/docbook-5.0

install -vm644 $DOCBOOK_DIR/dtd/* /usr/share/xml/docbook/schema/dtd/5.0
install -vm644 $DOCBOOK_DIR/rng/* /usr/share/xml/docbook/schema/rng/5.0
install -vm644 $DOCBOOK_DIR/sch/* /usr/share/xml/docbook/schema/sch/5.0
install -vm644 $DOCBOOK_DIR/xsd/* /usr/share/xml/docbook/schema/xsd/5.0


mkdir build &&
cd    build &&

meson setup ..        \
  --prefix=/usr       \
  --buildtype=release \
  -D docdir=/usr/share/doc/Linux-PAM-1.7.0 &&

ninja

install -v -m755 -d /etc/pam.d &&

if [ -e /etc/pam.d/other ]; then
    rm -rf /etc/pam.d/other
fi


ninja install
chmod -v 4755 /usr/sbin/unix_chkpwd

rm -rf /usr/lib/systemd

cat > /etc/pam.d/other << "EOF"
# Begin /etc/pam.d/other

auth            required        pam_unix.so     nullok
account         required        pam_unix.so
session         required        pam_unix.so
password        required        pam_unix.so     nullok

# End /etc/pam.d/other
EOF

install -vdm755 /etc/pam.d &&
cat > /etc/pam.d/system-account << "EOF" &&
# Begin /etc/pam.d/system-account

account   required    pam_unix.so

# End /etc/pam.d/system-account
EOF

cat > /etc/pam.d/system-auth << "EOF" &&
# Begin /etc/pam.d/system-auth

auth      required    pam_unix.so

# End /etc/pam.d/system-auth
EOF

cat > /etc/pam.d/system-session << "EOF" &&
# Begin /etc/pam.d/system-session

session   required    pam_unix.so

# End /etc/pam.d/system-session
EOF

cat > /etc/pam.d/system-password << "EOF"
# Begin /etc/pam.d/system-password

# use yescrypt hash for encryption, use shadow, and try to use any
# previously defined authentication token (chosen password) set by any
# prior module.
password  required    pam_unix.so       yescrypt shadow try_first_pass

# End /etc/pam.d/system-password
EOF

cat > /etc/pam.d/other << "EOF"
# Begin /etc/pam.d/other

auth        required        pam_warn.so
auth        required        pam_deny.so
account     required        pam_warn.so
account     required        pam_deny.so
password    required        pam_warn.so
password    required        pam_deny.so
session     required        pam_warn.so
session     required        pam_deny.so

# End /etc/pam.d/other
EOF


cat >> /root/dknotes << "EOF"
General setup --->
  [*] Auditing support            [AUDIT]

EOF