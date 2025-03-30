wget https://www.alsa-project.org/files/pub/lib/alsa-ucm-conf-1.2.13.tar.bz2

./configure &&
make

make install &&
tar -C /usr/share/alsa --strip-components=1 -xf alsa-ucm-conf-1.2.13.tar.bz2