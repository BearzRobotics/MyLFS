tar -xf ../xdgmime.tar.xz
make -C xdgmime

mkdir build
cd    build

meson setup --prefix=/usr --buildtype=release -D update-mimedb=true ..
ninja

ninja install
