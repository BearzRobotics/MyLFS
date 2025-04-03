# Create polkitd group if it doesn't exist
if ! getent group polkitd > /dev/null; then
    groupadd -fg 27 polkitd
fi

# Create polkitd user if it doesn't exist
if ! id -u polkitd > /dev/null 2>&1; then
    useradd -c "PolicyKit Daemon Owner" \
            -d /etc/polkit-1 \
            -u 27 \
            -g polkitd \
            -s /bin/false \
            polkitd
fi


mkdir build &&
cd    build &&

meson setup ..                     \
      --prefix=/usr                \
      --buildtype=release          \
      -D man=true                  \
      -D systemdsystemunitdir=/tmp \
      -D tests=true

ninja

ninja install

rm -v /tmp/*.service                 &&
rm -rf /usr/lib/{sysusers,tmpfiles}.d 