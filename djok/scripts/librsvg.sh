source /etc/profile

sed -e "/OUTDIR/s|,| / 'librsvg-2.59.2', '--no-namespace-dir',|" \
    -e '/output/s|Rsvg-2.0|librsvg-2.59.2|'                      \
    -i doc/meson.build

mkdir build &&
cd    build &&

meson setup --prefix=/usr --buildtype=release .. &&
ninja

ninja install