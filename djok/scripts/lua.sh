wget https://www.linuxfromscratch.org/patches/downloads/lua/lua-5.1.5-shared_library-2.patch
patch -Np1 -i lua-5.1.5-shared_library-2.patch &&
sed -i '/#define LUA_ROOT/s:/usr/local/:/usr/:' src/luaconf.h &&
make linux

make INSTALL_TOP=/usr TO_LIB="liblua.so liblua.so.5.1 liblua.so.5.1.5" \
     INSTALL_DATA="cp -d" INSTALL_MAN=/usr/share/man/man1 install &&
mkdir -pv /usr/share/doc/lua-5.1.5 &&
cp -v doc/*.{html,css,gif,png} /usr/share/doc/lua-5.1.5


cat > /usr/lib/pkgconfig/lua.pc << "EOF"
V=5.1
R=5.1.5

prefix=/usr
INSTALL_BIN=${prefix}/bin
INSTALL_INC=${prefix}/include
INSTALL_LIB=${prefix}/lib
INSTALL_MAN=${prefix}/man/man1
INSTALL_LMOD=${prefix}/share/lua/${V}
INSTALL_CMOD=${prefix}/lib/lua/${V}
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include

Name: Lua
Description: An Extensible Extension Language
Version: ${R}
Requires: 
Libs: -L${libdir} -llua -lm
Cflags: -I${includedir}
EOF
