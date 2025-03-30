pip3 install six

mkdir build &&
cd    build &&

../configure --prefix=/usr          \
             --with-system-readline \
             --with-python=/usr/bin/python3 &&
make

make -C gdb install &&
make -C gdbserver install