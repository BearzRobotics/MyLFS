pip3 install docutils


wget https://download.gnome.org/sources/gobject-introspection/1.82/gobject-introspection-1.82.0.tar.xz
wget https://www.linuxfromscratch.org/patches/blfs/12.3/glib-skip_warnings-1.patch

patch -Np1 -i glib-skip_warnings-1.patch

# if previous version is installed clean out headers to avoid conflict.
if [ -e /usr/include/glib-2.0 ]; then
    rm -rf /usr/include/glib-2.0.old &&
    mv -vf /usr/include/glib-2.0{,.old}
fi


mkdir build &&
cd    build &&

meson setup ..                  \
      --prefix=/usr             \
      --buildtype=release       \
      -D introspection=disabled \
      -D glib_debug=disabled    \
      -D man-pages=enabled      \
      -D sysprof=disabled       &&
ninja

ninja install

tar xf ../gobject-introspection-1.82.0.tar.xz 
meson setup gobject-introspection-1.82.0 gi-build \
            --prefix=/usr --buildtype=release     &&
ninja -C gi-build

ninja -C gi-build install

meson configure -D introspection=enabled &&
ninja

ninja install