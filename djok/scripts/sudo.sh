./configure --prefix=/usr              \
            --libexecdir=/usr/lib      \
            --with-secure-path         \
            --with-env-editor          \
            --docdir=/usr/share/doc/sudo-1.9.16p2 \
            --with-passprompt="[sudo] password for %p: " &&
make

make install

cat > /etc/sudoers.d/00-sudo << "EOF"
Defaults secure_path="/usr/sbin:/usr/bin"
%wheel ALL=(ALL) ALL
EOF

cat >> /root/dknotes << "EOF"
sudo - config
===========================================================
The defualt sudo config located in /etc/sudoers.d/00-sudo
creates allows all memebrs of the wheel group to use sudo.

Make sure to add your user account to this file!

usermod -aG wheel <username>

EOF