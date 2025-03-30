mkdir build &&
cd    build &&

meson setup --prefix=/usr          \
            --buildtype=release    \
            --wrap-mode=nofallback \
            -D systemd=disabled    \
            .. &&
ninja

ninja install

dbus-uuidgen --ensure

# elogind
ln -sfv /var/lib/dbus/machine-id /etc

if [ -e /usr/share/doc/dbus ]; then
  rm -rf /usr/share/doc/dbus-1.16.0    &&
  mv -v  /usr/share/doc/dbus{,-1.16.0}
fi

cat > /etc/dbus-1/session-local.conf << "EOF"
<!DOCTYPE busconfig PUBLIC
 "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
 "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
<busconfig>

  <!-- Search for .service files in /usr/local -->
  <servicedir>/usr/local/share/dbus-1/services</servicedir>

</busconfig>
EOF