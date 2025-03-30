# get extra fonts
wget https://github.com/BearzRobotics/figlet-fonts/archive/refs/tags/figlet-fonts-0.0.1.tar.gz

# Discripton: Create ASCII ART Text

# remove gnu macros for ensuring c++ compatiblity
#sed -i '/__BEGIN_DECLS/d' utf8.h
#sed -i '/__END_DECLS/d' utf8.h

# Figlet hard codes it's install path to /usr/local.
# this lets us change it to our Prefix
sed -i 's|/usr/local|$(PREFIX)|g' Makefile

make PREFIX=/usr install

# install fonts
tar -xf figlet-fonts-0.0.1.tar.gz 
cd figlet-fonts-figlet-fonts-0.0.1

# copy fonts in place
mkdir -vp /usr/share/figlet
cp -vf * /usr/share/figlet/