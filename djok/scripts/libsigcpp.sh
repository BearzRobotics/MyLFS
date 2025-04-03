mkdir bld &&
cd    bld &&

meson setup --prefix=/usr --buildtype=release .. &&
ninja

ninja install