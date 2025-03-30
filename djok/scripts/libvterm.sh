make PREFIX=/usr
make PREFIX=/usr install



cat > libvterm.pc <<EOF
prefix=/usr
exec_prefix=\${prefix}
libdir=\${exec_prefix}/lib
includedir=\${prefix}/include/vterm

Name: libvterm
Description: A terminal emulation library
Version: 0.1
Libs: -L\${libdir} -lvterm
Cflags: -I\${includedir}
EOF

install -Dm644 libvterm.pc /usr/lib/pkgconfig/libvterm.pc