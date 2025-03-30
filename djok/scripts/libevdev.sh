# /etc/profile has the pathappend function in
# plus /etc/profile.d/xorg.sh has our x environment variables
# which is soruced by /etc/profile
source /etc/profile

mkdir build &&
cd    build &&

meson setup ..                  \
      --prefix=$XORG_PREFIX     \
      --buildtype=release       \
      -D documentation=disabled &&
ninja


ninja install

cat >> /root/dknotes << "EOF"
Device Drivers --->
  Input device support --->
    -*-   Generic input layer (needed for keyboard, mouse, ...)          [INPUT]
    <*/M>   Event interface                                        [INPUT_EVDEV]

Device Drivers --->
  Input device support --->
    -*- Generic input layer (needed for keyboard, mouse, ...)            [INPUT]
    [*]   Miscellaneous devices --->                                [INPUT_MISC]
      <*/M>   User level driver support                           [INPUT_UINPUT]


EOF