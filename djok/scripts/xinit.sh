# /etc/profile has the pathappend function in
# plus /etc/profile.d/xorg.sh has our x environment variables
# which is soruced by /etc/profile
source /etc/profile

./configure $XORG_CONFIG --with-xinitdir=/etc/X11/app-defaults &&
make

make install &&
ldconfig

chmod u+s $XORG_PREFIX/bin/Xorg