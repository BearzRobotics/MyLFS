echo "usermod -a -G kvm <username>"


if [ $(uname -m) = i686 ]; then
   QEMU_ARCH=i386-softmmu
else
   QEMU_ARCH=x86_64-softmmu
fi


mkdir -vp build &&
cd        build &&

../configure --prefix=/usr               \
             --sysconfdir=/etc           \
             --localstatedir=/var        \
             --target-list=$QEMU_ARCH    \
             --audio-drv-list=alsa       \
             --disable-pa                \
             --enable-slirp              \
             --docdir=/usr/share/doc/qemu-9.2.2 

unset QEMU_ARCH 

make

make install

chgrp kvm  /usr/libexec/qemu-bridge-helper &&
chmod 4750 /usr/libexec/qemu-bridge-helper

ln -sv qemu-system-`uname -m` /usr/bin/qemu


cat >> /root/dknotes << "EOF"
qemu - kernel/other config
===========================================================
[*] Virtualization --->                                         [VIRTUALIZATION]
  <*/M>   Kernel-based Virtual Machine (KVM) support                       [KVM]
  # Enable the option for your CPU:
  < /*/M>   KVM for Intel (and compatible) processors support        [KVM_INTEL]
  < /*/M>   KVM for AMD processors support                             [KVM_AMD]

If you built bridge-utils
[*] Networking support --->                                                [NET]
  Networking options --->
    <*/M> 802.1d Ethernet Bridging                                      [BRIDGE]

Device Drivers --->
  [*] Network device support --->                                   [NETDEVICES]
    [*]   Network core driver support                                 [NET_CORE]
    <*/M>   Universal TUN/TAP device driver support                        [TUN]

to use KVM with qemu your user needs to be part of the kvm group

usermod -aG kvm <username>

EOF