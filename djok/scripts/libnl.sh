wget https://github.com/thom311/libnl/releases/download/libnl3_11_0/libnl-doc-3.11.0.tar.gz

./configure --prefix=/usr     \
            --sysconfdir=/etc \
            --disable-static  &&
make

make install

mkdir -vp /usr/share/doc/libnl-3.11.0 &&
tar -xf libnl-doc-3.11.0.tar.gz --strip-components=1 --no-same-owner \
    -C  /usr/share/doc/libnl-3.11.0

cat >> /root/dknotes << "EOF"
libn1 (iw & wpa_supplicant)
===========================================================
General setup --->
  -*- Namespaces support --->                                       [NAMESPACES]
    [*] User namespace                                                 [USER_NS]
    [*] Network namespace                                               [NET_NS]

[*] Networking support --->                                                [NET]
  Networking options --->
    [*]   TCP/IP networking                                               [INET]
    [*]     IP: advanced router                             [IP_ADVANCED_ROUTER]
    [*]       IP: policy routing                            [IP_MULTIPLE_TABLES]
    <*/M>   IP: tunneling                                             [NET_IPIP]
    <*/M>   IP: GRE demultiplexer                              [NET_IPGRE_DEMUX]
    <*/M>   IP: GRE tunnels over IP                                  [NET_IPGRE]
    <*/M>   Virtual (secure) IP: tunneling                           [NET_IPVTI]
    <*>     The IPv6 protocol --->                                        [IPV6]
      <*/M>   IPv6: IPv6-in-IPv4 tunnel (SIT driver)                  [IPV6_SIT]
      <*/M>   IPv6: IP-in-IPv6 tunnel (RFC2473)                    [IPV6_TUNNEL]
      [*]     IPv6: Multiple Routing Tables               [IPV6_MULTIPLE_TABLES]
    [*]   Network packet filtering framework (Netfilter) --->        [NETFILTER]
      Core Netfilter Configuration --->
        <*/M> Netfilter nf_tables support                            [NF_TABLES]
        [*]     Netfilter nf_tables netdev tables support     [NF_TABLES_NETDEV]
        {*/M}   Netfilter packet duplication support             [NF_DUP_NETDEV]
        <*/M>   Netfilter nf_tables netdev packet forwarding support
                                                           ...  [NFT_FWD_NETDEV]
    <*/M> 802.1d Ethernet Bridging                                      [BRIDGE]
    <*/M> 802.1Q/802.1ad VLAN Support                               [VLAN_8021Q]
    -*-   L3 Master device support                           [NET_L3_MASTER_DEV]

Device Drivers --->
  [*] Network device support --->                                   [NETDEVICES]
    [*]   Network core driver support                                 [NET_CORE]
    <*/M>   Bonding driver support                                     [BONDING]
    <*/M>   Dummy net driver support                                     [DUMMY]
    <*/M>   Intermediate Functional Block support                          [IFB]
    <*/M>   MAC-VLAN support                                           [MACVLAN]
    <*/M>     MAC-VLAN based tap driver                                [MACVTAP]
    <*/M>   IP-VLAN support                                             [IPVLAN]
    <*/M>   Virtual eXtensible Local Area Network (VXLAN)                [VXLAN]
    <*/M>   IEEE 802.1AE MAC-level encryption (MACsec)                  [MACSEC]
    <*/M>   Virtual ethernet pair device                                  [VETH]
    <*/M>   Virtual Routing and Forwarding (Lite)                      [NET_VRF]

EOF