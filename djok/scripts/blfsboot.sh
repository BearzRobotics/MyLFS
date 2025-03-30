# blfsboot

# each service need for blfs will be installed here. 
# Commet out if you disabled building a package
make install-service-dhcpcd
make install-rsyncd
make install-service-bridge
make install-service-wpa
make install-dbus