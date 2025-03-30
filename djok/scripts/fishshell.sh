export PATH_OLD=$PATH
export PATH=/opt/rustc/bin:$PATH

cargo build --release

install -v -m755 target/release/fish /usr/bin/fish
install -v -m755 target/release/fish_indent /usr/bin/fish_indent
install -v -m755 target/release/fish_key_reader /usr/bin/fish_key_reader

cp -v user_doc/man/man1/*.1 /usr/share/man/man1/
#mandb

export PATH=$PATH_OLD;