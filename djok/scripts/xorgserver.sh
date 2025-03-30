# /etc/profile has the pathappend function in
# plus /etc/profile.d/xorg.sh has our x environment variables
# which is soruced by /etc/profile
source /etc/profile

wget https://www.linuxfromscratch.org/patches/blfs/12.3/xorg-server-21.1.16-tearfree_backport-1.patch

patch -Np1 -i xorg-server-21.1.16-tearfree_backport-1.patch

mkdir build &&
cd    build &&

meson setup ..               \
      --prefix=$XORG_PREFIX  \
      --localstatedir=/var   \
      -D glamor=true         \
      -D systemd_logind=true \
      -D xkb_output_dir=/var/lib/xkb
ninja

ninja install 
mkdir -pv /etc/X11/xorg.conf.d 
install -v -d -m1777 /tmp/.{ICE,X11}-unix 
cat >> /etc/sysconfig/createfiles << "EOF"
/tmp/.ICE-unix dir 1777 root root
/tmp/.X11-unix dir 1777 root root
EOF

cat >> /root/dknotes << "EOF"
xorg server

Device Drivers --->
  Graphics support --->
    <*/M> Direct Rendering Manager (XFree86 4.1.0 and higher DRI support) --->
                                                                      ...  [DRM]
      < /*/M> DRM driver for VMware Virtual GPU                     [DRM_VMWGFX]
      < /*/M> DRM Support for bochs dispi vga interface (qemu stdvga)
                                                                ...  [DRM_BOCHS]
      < /*/M> Virtual Box Graphics Card                          [DRM_VBOXVIDEO]

Device Drivers --->
  Firmware Drivers --->
    [*] Mark VGA/VBE/EFI FB as generic system framebuffer       [SYSFB_SIMPLEFB]
  Graphics support --->
    <*> Direct Rendering Manager (XFree86 4.1.0 and higher DRI support) --->
                                                                      ...  [DRM]
      <*> Simple framebuffer driver                              [DRM_SIMPLEDRM]



vesa frame buffer support add to /boot/grub/grub.cfg if you want to enable
set gfxpayload=1024x768x32

EOF