mkdir build &&
cd    build &&

meson setup --prefix=/usr        \
            --buildtype=release  \
            -D docdir=/usr/share/doc/opus-1.5.2 &&
ninja

ninja install