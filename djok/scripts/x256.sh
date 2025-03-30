mkdir bld &&
cd    bld &&

cmake -D CMAKE_INSTALL_PREFIX=/usr \
      -D GIT_ARCHETYPE=1           \
      -W no-dev                    \
      ../source                    &&
make

make install &&
rm -vf /usr/lib/libx265.a