# /etc/profile has the pathappend function in
# plus /etc/profile.d/xorg.sh has our x environment variables
# which is soruced by /etc/profile
source /etc/profile

./configure $XORG_CONFIG --with-systemd-unit-dir=no &&
make

make install

cat >> /root/dknotes << "EOF"
wacom
===========================================================
Device Drivers --->
  [*] HID bus support --->                                         [HID_SUPPORT]
    {*/M} HID bus core support                                             [HID]
      Special HID drivers --->
      <*/M>   Wacom Intuos/Graphire tablet support (USB)             [HID_WACOM]
    USB HID support --->
      <*/M> USB HID transport layer                                    [USB_HID]
  [*] USB support --->                                             [USB_SUPPORT]
    <*/M> Support for Host-side USB                                        [USB]


EOF