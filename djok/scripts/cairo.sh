wget https://www.linuxfromscratch.org/patches/blfs/12.3/cairo-1.18.2-upstream_fixes-1.patch

patch -Np1 -i cairo-1.18.2-upstream_fixes-1.patch

mkdir build &&
cd    build &&

meson setup --prefix=/usr --buildtype=release .. &&
ninja

ninja install