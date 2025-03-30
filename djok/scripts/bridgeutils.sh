

autoconf                  &&
./configure --prefix=/usr &&
make

make install



cat >> /root/dknotes << "EOF"
Bridge Utils - kernel options
===========================================================
[*] Networking support --->                                                [NET]
  Networking options --->
    <*/M> 802.1d Ethernet Bridging                                      [BRIDGE]
EOF