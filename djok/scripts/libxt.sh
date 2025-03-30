# /etc/profile has the pathappend function in
# plus /etc/profile.d/xorg.sh has our x environment variables
# which is soruced by /etc/profile
source /etc/profile

./configure $XORG_CONFIG --docdir=$XORG_PREFIX/share/doc/libXt-1.3.1  --with-appdefaultdir=/etc/X11/app-defaults
make

make install