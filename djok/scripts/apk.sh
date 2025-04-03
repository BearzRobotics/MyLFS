# This looks like it cuold be built at the end of pahse 4

# dependices 
# musl or glibc (C library)
# openssl (for cryptography, TLS, and signature verification)
# zlib (for handling compressed data)
# libcrypto (part of OpenSSL, sometimes treated separately)
# libssl (part of OpenSSL, for HTTPS)

# run time deps
# make
# gcc or clang
# pkgconf or pkg-config
# musl-dev or glibc-dev
# openssl-dev
# zlib-dev
# lua-dev (if Lua support is enabled)

# Optional 
# scdoc

meson setup build --prefix=/usr
ninja -C build
ninja -C build install