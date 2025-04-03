
source /etc/profile

wget https://download.gnome.org/sources/gobject-introspection/1.84/gobject-introspection-1.84.0.tar.xz
wget https://www.linuxfromscratch.org/patches/blfs/12.3/glib-skip_warnings-1.patch
wget https://www.linuxfromscratch.org/patches/blfs/svn/glib-2.84.0-upstream_fixes-1.patch

tar -xf gobject-introspection-1.84.0.tar.xz

patch -Np1 -i glib-skip_warnings-1.patch


if [ -e /usr/include/glib-2.0 ]; then
    rm -rf /usr/include/glib-2.0.old
    mv -v /usr/include/glib-2.0{,.old}
fi

patch -Np1 -i glib-2.84.0-upstream_fixes-1.patch

mkdir build
cd    build

meson setup ..                  \
      --prefix=/usr             \
      --buildtype=release       \
      -D introspection=disabled \
      -D glib_debug=disabled    \
      -D man-pages=enabled      \
      -D sysprof=disabled       
ninja

ninja install


cd ..

meson setup gobject-introspection-1.84.0 gi-build \
            --prefix=/usr --buildtype=release    
ninja -C gi-build
cd gi-build
ninja install

cd ..
mkdir gbuild
cd gbuild

meson setup ..                  \
      --prefix=/usr             \
      --buildtype=release       \
      -D introspection=enabled \
      -D glib_debug=disabled    \
      -D man-pages=enabled      \
      -D sysprof=disabled       
ninja

ninja install