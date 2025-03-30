# /etc/profile has the pathappend function in
# plus /etc/profile.d/xorg.sh has our x environment variables
# which is soruced by /etc/profile
source /etc/profile

mkdir build &&
cd    build &&

meson setup ..                  \
      --prefix=$XORG_PREFIX     \
      --buildtype=release       \
      -D debug-gui=false        \
      -D tests=false            \
      -D libwacom=false         \
      -D udev-dir=/usr/lib/udev &&
ninja

ninja install



cat >> /root/dknotes << "EOF"
Libinput
===========================================================
Device Drivers --->
  Input device support --->
    -*- Generic input layer (needed for keyboard, mouse, ...)            [INPUT]
    [*]   Miscellaneous devices --->                                [INPUT_MISC]
      <*/M>   User level driver support                           [INPUT_UINPUT]

EOF