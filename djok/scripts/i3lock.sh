#pkg-config
#libxcb
#libxcb-util
#libpam-dev
#libcairo-dev
#libxcb-xinerama
#libxcb-randr
#libev
#libx11-dev
#libx11-xcb-dev
#libxkbcommon >= 0.5.0
#libxkbcommon-x11 >= 0.5.0
#libxcb-image
#libxcb-xrm

#rm -rf build/
#mkdir -p build && cd build/

meson setup build --prefix=/usr --bindir=/usr/bin --sbindir=/usr/sbin --libdir=/usr/lib --datadir=/usr/share --sysconfdir=/etc
ninja -C build
ninja -C build install