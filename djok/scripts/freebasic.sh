echo "Built without gfx suport because we don't have x11 libs"

wget https://sourceforge.net/projects/fbc/files/FreeBASIC-1.10.1/Documentation/FB-manual-1.10.1-txt.zip
wget https://sourceforge.net/projects/fbc/files/FreeBASIC-1.10.1/Source/FreeBASIC-1.10.1-source.tar.gz

tar -xf FreeBASIC-1.10.1-source.tar.gz

CFLAGS="-I/usr/lib/ncurses5/include" LDFLAGS="-L/usr/lib/ncurses5/lib"

cd FreeBASIC-1.10.1-source
make FBC=../bin/fbc

make install


cp -frv examples /root/fbe/

cd ..
# docs
unzip FB-manual-1.10.1-txt.zip

mkdir -pv /usr/doc/freebasic-1.10.1/
cp -pv FB-manual-1.10.1.txt /usr/doc/freebasic-1.10.1/FB-manual-1.10.1.txt

cat >> /root/dknotes << "EOF"
freebasic
===========================================================
Freebasic is built without gfx support. As on linux it 
requires x11 libs and I haven't built them.

If you want this support. Rebuiled the package with 
freebasic2 and place it after the required x11 libs

In theory FBC graphcis programs on the framebuffer.
make sure it's enabled in the kernel and that your
user is part of the video group.

EOF