#libconfuse-dev
#libyajl-dev
#libasound2-dev
#libnl-genl-3-dev
#meson (compile-time only dependency)
#asciidoc (only for the documentation)
#libpulse-dev (for getting the current volume using PulseAudio)

mkdir build
cd build
meson ..
ninja
ninja install