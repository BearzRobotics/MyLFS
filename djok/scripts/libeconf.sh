meson setup build --prefix=/usr

ninja -C build
meson install -C build
