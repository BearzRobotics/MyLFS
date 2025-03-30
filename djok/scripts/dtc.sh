mkdir build &&
cd    build &&

meson setup --prefix=/usr         \
            --buildtype=release   \
            -D python=disabled .. &&
ninja

ninja install

rm /usr/lib/libfdt.a

cp -R ../Documentation -T /usr/share/doc/dtc-1.7.2

pip3 wheel -w dist --no-build-isolation --no-deps --no-cache-dir ..