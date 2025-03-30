source /etc/profile

cargo build --release

install -v -m755 target/release/bindgen /usr/bin

bindgen --generate-shell-completions bash \
    > /usr/share/bash-completion/completions/bindgen
bindgen --generate-shell-completions zsh  \
    > /usr/share/zsh/site-functions/_bindgen