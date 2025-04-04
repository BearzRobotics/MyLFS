mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON -DLUA_BUILD_TYPE=System -DCMAKE_INSTALL_PREFIX=/usr
make

make install