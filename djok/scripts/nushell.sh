echo $PATH 
export PATH_OLD=$PATH
export PATH=/opt/rustc/bin:$PATH

cargo build --release --workspace


install -v -m755 target/release/nu /usr/bin/nu

for plugin in target/release/nu_plugin_*; do
  install -Dm755 "$plugin" "/usr/bin/$(basename "$plugin")"
done


export PATH=$PATH_OLD