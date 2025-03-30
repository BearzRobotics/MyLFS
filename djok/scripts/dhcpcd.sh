
echo "Boot files for sysvinit installed with package blfsboot.sh"


# configure
./configure --prefix=/usr                \
            --sysconfdir=/etc            \
            --libexecdir=/usr/lib/dhcpcd \
            --dbdir=/var/lib/dhcpcd      \
            --runstatedir=/run           \
            --disable-privsep         

# build & install
make && make install

cat > /etc/resolv.conf.head << "EOF"
# OpenDNS servers
nameserver 208.67.222.222
nameserver 208.67.220.220
EOF


cat > /etc/sysconfig/ifconfig.eth0 << "EOF"
ONBOOT="yes"
IFACE="eth0"
SERVICE="dhcpcd"
DHCP_START="-b -q -h $HOSTNAME <insert appropriate start options here>"
DHCP_STOP="-k"
#DHCP_STOP="-k <insert additional stop options here>"
EOF


