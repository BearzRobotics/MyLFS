sudo install -Dm755 zig /usr/bin/zig

# Optional: install stdlib + docs
sudo mkdir -p /usr/lib/zig
sudo cp -r lib/* /usr/lib/zig/

sudo ln -svf /usr/lib/zig /usr/share/zig

sudo mkdir -p /usr/share/doc/zig-0.14.0
sudo cp -r doc/* /usr/share/doc/zig-0.14.0/