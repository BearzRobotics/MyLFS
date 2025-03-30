sed -i '/^udev/,$ s/^/#/' util/meson.build &&

mkdir build &&
cd    build &&

meson setup --prefix=/usr --buildtype=release .. &&
ninja

ninja install                  &&
chmod u+s /usr/bin/fusermount3 &&

cd ..                          &&
cp -Rv doc/html -T /usr/share/doc/fuse-3.16.2 &&
install -v -m644   doc/{README.NFS,kernel.txt} \
                   /usr/share/doc/fuse-3.16.2

cat > /etc/fuse.conf << "EOF"
# Set the maximum number of FUSE mounts allowed to non-root users.
# The default is 1000.
#
#mount_max = 1000

# Allow non-root users to specify the 'allow_other' or 'allow_root'
# mount options.
#
#user_allow_other
EOF

cat >> /root/dknotes << "EOF"
FUSE - kernel options
===========================================================
File systems --->
  <*/M> FUSE (Filesystem in Userspace) support                         [FUSE_FS]

# if you want test support
File systems --->
  <*/M> FUSE (Filesystem in Userspace) support                         [FUSE_FS]
  <*/M>   Character device in Userspace support                           [CUSE]

EOF