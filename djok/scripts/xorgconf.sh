# /etc/profile has the pathappend function in
# plus /etc/profile.d/xorg.sh has our x environment variables
# which is soruced by /etc/profile
source /etc/profile

cat > /etc/X11/xorg.conf.d/xkb-defaults.conf << "EOF"
Section "InputClass"
    Identifier "XKB Defaults"
    MatchIsKeyboard "yes"
    Option "XkbLayout" "fr"
    Option "XkbOptions" "terminate:ctrl_alt_bksp"
EndSection
EOF


cat > /etc/X11/xorg.conf.d/server-layout.conf << "EOF"
Section "ServerLayout"
    Identifier     "DefaultLayout"
    Screen      0  "Screen0" 0 0
    Screen      1  "Screen1" LeftOf "Screen0"
    Option         "Xinerama"
EndSection
EOF

cat > /etc/X11/xorg.conf.d/monitor-DP-1.conf << "EOF"
Section "Monitor"
    Identifier  "DP-1"
    Modeline    "1024x768_60.00"  118.25  1600 1696 1856 2112  900 903 908 934 -hsync +vsync
    Option      "PreferredMode"   "1024x768_60.00"
EndSection
EOF

cat > /etc/X11/xorg.conf.d/monitor-DP-1.conf << "EOF"
Section "Monitor"
    Identifier  "DP-1"
    Option      "PreferredMode" "1024x768"
EndSection
EOF

cat > /etc/X11/xorg.conf.d/20-tearfree.conf << "EOF"
Section "Device"
   Identifier "Graphics Adapter"
   Driver     "modesetting"
   Option     "TearFree" "true"
EndSection
EOF