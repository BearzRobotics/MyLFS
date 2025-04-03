meson setup build --prefix=/usr --buildtype=release
ninja -C build
ninja -C build install