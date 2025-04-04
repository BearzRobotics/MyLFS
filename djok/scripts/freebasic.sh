#echo "Built without gfx suport because we don't have x11 libs"

wget https://sourceforge.net/projects/fbc/files/FreeBASIC-1.10.1/Documentation/FB-manual-1.10.1-txt.zip
wget https://sourceforge.net/projects/fbc/files/FreeBASIC-1.10.1/Source/FreeBASIC-1.10.1-source.tar.gz



./install.sh -i /usr

#tar -xf FreeBASIC-1.10.1-source.tar.gz

#CFLAGS="-I/usr/lib/ncurses5/include" LDFLAGS="-L/usr/lib/ncurses5/lib"

#cd FreeBASIC-1.10.1-source
#make FBC=../bin/fbc

#make install



cp -frv examples /root/fbe/
# cd ..
# docs
unzip FB-manual-1.10.1-txt.zip

mkdir -pv /usr/doc/freebasic-1.10.1/
cp -pv FB-manual-1.10.1.txt /usr/doc/freebasic-1.10.1/FB-manual-1.10.1.txt
