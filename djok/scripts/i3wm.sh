
# need libstartup-notification
# need ice
# need x11
# need xcb

meson setup build --prefix=/usr
ninja -C build
ninja -C build install