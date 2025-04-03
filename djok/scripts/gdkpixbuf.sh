mkdir build &&
cd    build &&

meson setup ..            \
      --prefix=/usr       \
      --buildtype=release \
      -D others=enabled   \
      --wrap-mode=nofallback &&
ninja

ninja install