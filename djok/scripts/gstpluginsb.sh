source /etc/profile

mkdir build
cd    build

meson setup ..             \
      --prefix=/usr        \
      -Dtests=disabled      \
      --buildtype=release   \
      --wrap-mode=nodownload
ninja

ninja install