# /etc/profile has the pathappend function in
# plus /etc/profile.d/xorg.sh has our x environment variables
# which is soruced by /etc/profile
source /etc/profile

./configure $XORG_CONFIG --docdir=$XORG_PREFIX/share/doc/libXext-1.3.6
make

make install