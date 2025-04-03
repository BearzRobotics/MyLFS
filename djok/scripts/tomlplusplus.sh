cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`

cmake --install ./build


cat > /usr/lib/pkgconfig/tomlplusplus.pc << EOF
prefix=/usr
includedir=\${prefix}/include

Name: tomlplusplus
Description: toml++ header-only library
Version: 3.4.0

Cflags: -I\${includedir}
EOF
