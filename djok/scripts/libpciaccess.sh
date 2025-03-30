# /etc/profile has the pathappend function in
# plus /etc/profile.d/xorg.sh has our x environment variables
# which is soruced by /etc/profile
source /etc/profile

mkdir build
cd    build
meson setup --prefix=$XORG_PREFIX --buildtype=release ..
ninja

ninja install