cmake -DCMAKE_INSTALL_PREFIX=/usr -B build
cmake --build build -j `nproc`

cmake --install build