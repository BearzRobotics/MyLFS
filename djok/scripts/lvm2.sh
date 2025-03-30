PATH+=:/usr/sbin                \
./configure --prefix=/usr       \
            --enable-cmdlib     \
            --enable-pkgconfig  \
            --enable-udev_sync  &&
make

make -C tools install_tools_dynamic &&
make -C udev  install               &&
make -C libdm install

make install
rm -fv /usr/lib/udev/rules.d/69-dm-lvm.rules