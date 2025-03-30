meson setup build

ninja -C build

sudo ninja -C build install

cp -vf /usr/local/share/wayland-sessions/hyprland.desktop /usr/share/wayland-sessions/

mkdir -pv /etc/skel/.config/hypr
mkdir -pv ~/.config/hypr
cp example/hyprland.conf /etc/skel/.config/hypr
cp example/hyprland.conf ~/.config/hypr