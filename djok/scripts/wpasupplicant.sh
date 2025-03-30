cat > wpa_supplicant/.config << "EOF"
CONFIG_BACKEND=file
CONFIG_CTRL_IFACE=y
CONFIG_DEBUG_FILE=y
CONFIG_DEBUG_SYSLOG=y
CONFIG_DEBUG_SYSLOG_FACILITY=LOG_DAEMON
CONFIG_DRIVER_NL80211=y
CONFIG_DRIVER_WEXT=y
CONFIG_DRIVER_WIRED=y
CONFIG_EAP_GTC=y
CONFIG_EAP_LEAP=y
CONFIG_EAP_MD5=y
CONFIG_EAP_MSCHAPV2=y
CONFIG_EAP_OTP=y
CONFIG_EAP_PEAP=y
CONFIG_EAP_TLS=y
CONFIG_EAP_TTLS=y
CONFIG_IEEE8021X_EAPOL=y
CONFIG_IPV6=y
CONFIG_LIBNL32=y
CONFIG_PEERKEY=y
CONFIG_PKCS12=y
CONFIG_READLINE=y
CONFIG_SMARTCARD=y
CONFIG_WPS=y
CFLAGS += -I/usr/include/libnl3
EOF

cd wpa_supplicant
make BINDIR=/usr/sbin LIBDIR=/usr/lib

install -v -m755 wpa_{cli,passphrase,supplicant} /usr/sbin/ 
install -v -m644 doc/docbook/wpa_supplicant.conf.5 /usr/share/man/man5/ 
install -v -m644 doc/docbook/wpa_{cli,passphrase,supplicant}.8 /usr/share/man/man8/

# preprogram Cuylers wifi into the system
wpa_passphrase "The Lord's Network" "Vandalism12!?" > /etc/sysconfig/wpa_supplicant-wifi0.conf


cat > /etc/sysconfig/ifconfig.wifi0 << "EOF"
ONBOOT="yes"
IFACE="wlan0"
SERVICE="wpa"

# Additional arguments to wpa_supplicant
WPA_ARGS=""

WPA_SERVICE="dhcpcd"
DHCP_START="-b -q <insert appropriate start options here>"
DHCP_STOP="-k <insert additional stop options here>"
EOF

cat >> /root/dknotes << "EOF"
for static ip write the following to /etc/sysconfig/ifconfig.wifi0
current files uses Dhcpcd 
---
ONBOOT="yes"
IFACE="wlan0"
SERVICE="wpa"

# Additional arguments to wpa_supplicant
WPA_ARGS=""

WPA_SERVICE="ipv4-static"
IP="192.168.1.1"
GATEWAY="192.168.1.2"
PREFIX="24"
BROADCAST="192.168.1.255"
---
EOF