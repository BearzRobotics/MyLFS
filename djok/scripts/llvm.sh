#many scripts that use python. -- This patches them to just invoke python3
grep -rl '#!.*python' | xargs sed -i '1s/python$/python3/'

cd llvm

# Ensure the FileCheck Program is being built
sed 's/utility/tool/' -i utils/FileCheck/CMakeLists.txt

mkdir -v build && cd build

# compare to the docs for questons
#https://llvm.org/docs/CMake.html#quick-start
#https://cmake.org/cmake/help/latest/index.html

# Origional options (worked)
# cmake -D CMAKE_INSTALL_PREFIX=/usr           \
#      -D CMAKE_SKIP_INSTALL_RPATH=ON         \
#      -D LLVM_ENABLE_FFI=ON                  \
#      -D CMAKE_BUILD_TYPE=Release            \
#      -D LLVM_BUILD_LLVM_DYLIB=ON            \
#      -D LLVM_LINK_LLVM_DYLIB=ON             \
#      -D LLVM_ENABLE_LIBCXX=ON               \
#      -D LLVM_ENABLE_RTTI=ON                 \
#      -D LLVM_TARGETS_TO_BUILD="host"           \
#      -D LLVM_BINUTILS_INCDIR=/usr/include   \
#      -D LLVM_INCLUDE_BENCHMARKS=OFF         \
#      -D CLANG_DEFAULT_PIE_ON_LINUX=ON       \
#      -D CLANG_CONFIG_FILE_SYSTEM_DIR=/etc/clang \
#      -D CMAKE_CXX_FLAGS="-std=c++11" \
#      -D LLVM_ENABLE_PROJECTS="clang;lld;lldb;compiler-rt" \
#      -W no-dev -G Ninja ..   

# 2nd attempt options (worked)
# cmake -D CMAKE_INSTALL_PREFIX=/usr           \
#      -D CMAKE_SKIP_INSTALL_RPATH=ON         \
#      -D LLVM_ENABLE_FFI=ON                  \
#      -D CMAKE_BUILD_TYPE=Release            \
#      -D LLVM_BUILD_LLVM_DYLIB=ON            \
#      -D LLVM_LINK_LLVM_DYLIB=ON             \
#      -D LLVM_ENABLE_LIBCXX=ON               \
#      -D LLVM_ENABLE_RTTI=ON                 \
#      -D LLVM_TARGETS_TO_BUILD=all           \
#      -D LLVM_BINUTILS_INCDIR=/usr/include   \
#      -D LLVM_INCLUDE_BENCHMARKS=OFF         \
#      -D CLANG_DEFAULT_PIE_ON_LINUX=ON       \
#      -D CLANG_CONFIG_FILE_SYSTEM_DIR=/etc/clang \
#      -D CMAKE_CXX_FLAGS="-std=c++11" \
#      -DLLVM_ENABLE_PROJECTS="clang;lld" \
#      -DLLVM_ENABLE_RUNTIMES="compiler-rt;libcxx;libcxxabi;libunwind;openmp" \
#      -W no-dev -G Ninja ..  

cmake -D CMAKE_INSTALL_PREFIX=/usr           \
      -D CMAKE_SKIP_INSTALL_RPATH=ON         \
      -D LLVM_ENABLE_FFI=ON                  \
      -D CMAKE_BUILD_TYPE=Release            \
      -D LLVM_BUILD_LLVM_DYLIB=ON            \
      -D LLVM_LINK_LLVM_DYLIB=ON             \
      -D LLVM_ENABLE_LIBCXX=ON               \
      -D LLVM_ENABLE_RTTI=ON                 \
      -D LLVM_TARGETS_TO_BUILD=all           \
      -D LLVM_BINUTILS_INCDIR=/usr/include   \
      -D LLVM_INCLUDE_BENCHMARKS=OFF         \
      -D CLANG_DEFAULT_PIE_ON_LINUX=ON       \
      -D CLANG_CONFIG_FILE_SYSTEM_DIR=/etc/clang \
      -D CMAKE_CXX_FLAGS="-std=c++11" \
      -DLLVM_ENABLE_PROJECTS="clang;lld" \
      -DLLVM_ENABLE_RUNTIMES="compiler-rt;libcxx;libcxxabi;libunwind;openmp" \
      -W no-dev -G Ninja ..              
ninja
ninja install

mkdir -pv /etc/clang

cat > /etc/clang/clang.cfg << "EOF"
-B/usr/lib/gcc/x86_64-linux-musl/14.2.0
-L/usr/lib/gcc/x86_64-linux-musl/14.2.0
EOF

cat > /etc/clang/clang++.cfg << "EOF"
-B/usr/lib/gcc/x86_64-linux-musl/14.2.0
-L/usr/lib/gcc/x86_64-linux-musl/14.2.0
EOF


# If this doesn't work clang is broken
echo 'int main(){}' > dummy.c
clang dummy.c
readelf -l a.out | grep ': /lib' 
rm -v dummy.c a.out

# [Requesting program interpreter: /lib64/ld-linux-x86-64.so.2]
# /lib64 -> /usr/lib