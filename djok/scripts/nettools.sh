export BINDIR='/usr/bin' SBINDIR='/usr/bin' &&
yes "" | make -j1                           &&
make DESTDIR=$PWD/install -j1 install       &&
rm    install/usr/bin/{nis,yp}domainname    &&
rm    install/usr/bin/{hostname,dnsdomainname,domainname,ifconfig} &&
rm -r install/usr/share/man/man1            &&
rm    install/usr/share/man/man8/ifconfig.8 &&
unset BINDIR SBINDIR

chown -R root:root install &&
cp -a install/* /