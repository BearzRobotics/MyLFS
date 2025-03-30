# /etc/profile has the pathappend function in
# plus /etc/profile.d/xorg.sh has our x environment variables
# which is soruced by /etc/profile
source /etc/profile

cat > /etc/profile.d/xorg.sh << "EOF"

export XORG_PREFIX=/usr
export XORG_CONFIG="--prefix=$XORG_PREFIX --sysconfdir=/etc --localstatedir=/var --disable-static"
 

pathappend $XORG_PREFIX/bin             PATH
pathappend $XORG_PREFIX/lib/pkgconfig   PKG_CONFIG_PATH
pathappend $XORG_PREFIX/share/pkgconfig PKG_CONFIG_PATH

pathappend $XORG_PREFIX/lib             LIBRARY_PATH
pathappend $XORG_PREFIX/include         C_INCLUDE_PATH
pathappend $XORG_PREFIX/include         CPLUS_INCLUDE_PATH

ACLOCAL="aclocal -I $XORG_PREFIX/share/aclocal"

export PATH PKG_CONFIG_PATH ACLOCAL LIBRARY_PATH C_INCLUDE_PATH CPLUS_INCLUDE_PATH
EOF

mkdir -pv /etc/sudoers.d

cat > /etc/sudoers.d/xorg << EOF
Defaults env_keep += XORG_PREFIX
Defaults env_keep += XORG_CONFIG
EOF

source /etc/profile.d/xorg.sh

echo "$XORG_PREFIX/lib" >> /etc/ld.so.conf

sed -e "s@X11R6/man@X11R6/share/man@g" \
    -e "s@/usr/X11R6@$XORG_PREFIX@g"   \
    -i /etc/man_db.conf
