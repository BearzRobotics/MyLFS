meson setup build --prefix=/usr --bindir=/usr/bin --sbindir=/usr/sbin --libdir=/usr/lib --datadir=/usr/share --sysconfdir=/etc
ninja -C build
ninja -C build install

#mkdir -pv /usr/share/wayland-sessions/
#cp -vf /usr/local/share/wayland-sessions/hyprland.desktop /usr/share/wayland-sessions/

mkdir -pv /etc/skel/.config/hypr
mkdir -pv ~/.config/hypr
cp example/hyprland.conf /etc/skel/.config/hypr
cp example/hyprland.conf ~/.config/hypr

cat > /usr/bin/startHyperland << "EOF"
#!/bin/sh

# Set some necessary environment variables
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_DESKTOP=Hyprland
export GDK_BACKEND=wayland,x11
export QT_QPA_PLATFORM=wayland;xcb


XDG_RUNTIME_DIR="/tmp/xdg-$USER"

# Create if it doesn't exist
if [ ! -d "$XDG_RUNTIME_DIR" ]; then
    mkdir -p "$XDG_RUNTIME_DIR"
    chmod 700 "$XDG_RUNTIME_DIR"
    echo "Created $XDG_RUNTIME_DIR"
fi




# Launch Hyprland
exec hyprland
EOF

chmod +x /usr/bin/startHyperland