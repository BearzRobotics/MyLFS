
source /etc/profile
# === Step 1 — Download sources ===

wget https://download.gnome.org/sources/gobject-introspection/1.82/gobject-introspection-1.82.0.tar.xz
wget https://www.linuxfromscratch.org/patches/blfs/12.3/glib-skip_warnings-1.patch

# === Step 2 — Extract gobject-introspection ===

tar xf gobject-introspection-1.82.0.tar.xz

# === Step 3 — Apply glib patch ===

patch -Np1 -i glib-skip_warnings-1.patch

# === Step 4 — Remove old glib headers if needed ===

if [ -e /usr/include/glib-2.0 ]; then
    rm -rf /usr/include/glib-2.0.old
    mv -v /usr/include/glib-2.0{,.old}
fi

# === Step 5 — Build GLib with introspection enabled ===

mkdir -pv build
cd build

meson setup .. \
    --prefix=/usr \
    --buildtype=release \
    -D introspection=enabled \
    -D glib_debug=disabled \
    -D man-pages=enabled \
    -D sysprof=disabled

ninja
ninja install

cd ..

# === Step 6 — Now build and install gobject-introspection ===

cd gobject-introspection-1.82.0

meson setup build --prefix=/usr --buildtype=release
ninja -C build
ninja -C build install

# === Done ===

echo "glib + gobject-introspection built successfully"
