export PATH_OLD=$PATH
export PATH=/opt/rustc/bin:$PATH

curl -LO https://github.com/lu-zero/cargo-c/releases/download/v0.10.11/Cargo.lock

[ ! -e /usr/include/libssh2.h ] || export LIBSSH2_SYS_USE_PKG_CONFIG=1    &&
[ ! -e /usr/include/sqlite3.h ] || export LIBSQLITE3_SYS_USE_PKG_CONFIG=1 &&

cargo build --release

install -vm755 target/release/cargo-{capi,cbuild,cinstall,ctest} /usr/bin/


export PATH=$PATH_OLD