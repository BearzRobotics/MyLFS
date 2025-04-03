


cat >> /root/dknotes << "EOF"
Elogind
################################################################################
File systems --->
  [*] Inotify support for userspace                               [INOTIFY_USER]
  Pseudo filesystems --->
    [*] Tmpfs virtual memory file system support (former shm fs)         [TMPFS]
    [*]   Tmpfs POSIX Access Control Lists                     [TMPFS_POSIX_ACL]

some test require

-*- Cryptographic API --->                                              [CRYPTO]
  Crypto core or helper --->
    <*/M> Userspace cryptographic algorithm configuration          [CRYPTO_USER]
  Userspace interface --->
    <*/M> Hash algorithms                                 [CRYPTO_USER_API_HASH]

EOF 


mkdir build &&
cd    build &&

meson setup ..                               \
      --prefix=/usr                          \
      --buildtype=release                    \
      -D man=auto                            \
      -D docdir=/usr/share/doc/elogind-255.17 \
      -D cgroup-controller=elogind           \
      -D dev-kvm-mode=0660                   \
      -D dbuspolicydir=/etc/dbus-1/system.d &&
ninja

ninja install                                           &&
ln -sfv  libelogind.pc /usr/lib/pkgconfig/libsystemd.pc &&
ln -sfvn elogind /usr/include/systemd

sed -e '/\[Login\]/a KillUserProcesses=no' \
    -i /etc/elogind/logind.conf

cat >> /etc/pam.d/system-session << "EOF" &&
# Begin elogind addition

session  required    pam_loginuid.so
session  optional    pam_elogind.so

# End elogind addition
EOF
cat > /etc/pam.d/elogind-user << "EOF"
# Begin /etc/pam.d/elogind-user

account  required    pam_access.so
account  include     system-account

session  required    pam_env.so
session  required    pam_limits.so
session  required    pam_unix.so
session  required    pam_loginuid.so
session  optional    pam_keyinit.so force revoke
session  optional    pam_elogind.so

auth     required    pam_deny.so
password required    pam_deny.so

# End /etc/pam.d/elogind-user
EOF