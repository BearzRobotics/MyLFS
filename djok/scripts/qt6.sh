export QT6PREFIX=/usr
# export QT6PREFIX=/opt/qt6
# mkdir -pv /opt/qt-6.8.2
# ln -sfnv qt-6.8.2 /opt/qt6



./configure -prefix $QT6PREFIX      \
            -sysconfdir /etc/xdg    \
            -dbus-linked            \
            -openssl-linked         \
            -system-sqlite          \
            -nomake examples        \
            -no-rpath               \
            -syslog                 \
            -skip qt3d              \
            -skip qtquick3dphysics  \
            -skip qtwebengine       &&
ninja

ninja install


find $QT6PREFIX/ -name \*.prl \
   -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

pushd qttools/src &&

install -v -Dm644 assistant/assistant/images/assistant-128.png       \
                  /usr/share/pixmaps/assistant-qt6.png               &&

install -v -Dm644 designer/src/designer/images/designer.png          \
                  /usr/share/pixmaps/designer-qt6.png                &&

install -v -Dm644 linguist/linguist/images/icons/linguist-128-32.png \
                  /usr/share/pixmaps/linguist-qt6.png                &&

install -v -Dm644 qdbus/qdbusviewer/images/qdbusviewer-128.png       \
                  /usr/share/pixmaps/qdbusviewer-qt6.png             &&
popd &&


cat > /usr/share/applications/assistant-qt6.desktop << EOF
[Desktop Entry]
Name=Qt6 Assistant
Comment=Shows Qt6 documentation and examples
Exec=$QT6PREFIX/bin/assistant
Icon=assistant-qt6.png
Terminal=false
Encoding=UTF-8
Type=Application
Categories=Qt;Development;Documentation;
EOF

cat > /usr/share/applications/designer-qt6.desktop << EOF
[Desktop Entry]
Name=Qt6 Designer
GenericName=Interface Designer
Comment=Design GUIs for Qt6 applications
Exec=$QT6PREFIX/bin/designer
Icon=designer-qt6.png
MimeType=application/x-designer;
Terminal=false
Encoding=UTF-8
Type=Application
Categories=Qt;Development;
EOF

cat > /usr/share/applications/linguist-qt6.desktop << EOF
[Desktop Entry]
Name=Qt6 Linguist
Comment=Add translations to Qt6 applications
Exec=$QT6PREFIX/bin/linguist
Icon=linguist-qt6.png
MimeType=text/vnd.trolltech.linguist;application/x-linguist;
Terminal=false
Encoding=UTF-8
Type=Application
Categories=Qt;Development;
EOF

cat > /usr/share/applications/qdbusviewer-qt6.desktop << EOF
[Desktop Entry]
Name=Qt6 QDbusViewer
GenericName=D-Bus Debugger
Comment=Debug D-Bus applications
Exec=$QT6PREFIX/bin/qdbusviewer
Icon=qdbusviewer-qt6.png
Terminal=false
Encoding=UTF-8
Type=Application
Categories=Qt;Development;Debugger;
EOF