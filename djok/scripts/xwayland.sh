# /etc/profile has the pathappend function in
# plus /etc/profile.d/xorg.sh has our x environment variables
# which is soruced by /etc/profile
source /etc/profile

sed -i '/install_man/,$d' meson.build &&

mkdir build &&
cd    build &&

meson setup ..                       \
      --prefix=$XORG_PREFIX          \
      --buildtype=release            \
      -D xkb_output_dir=/var/lib/xkb &&
ninja

ninja install &&
cat >> /etc/sysconfig/createfiles << "EOF"
/tmp/.X11-unix dir 1777 root root
EOF