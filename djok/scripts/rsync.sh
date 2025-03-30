echo "Boot scripts installed in blfsboot package"

groupadd -g 48 rsyncd &&
useradd -c "rsyncd Daemon" -m -d /home/rsync -g rsyncd \
    -s /bin/false -u 48 rsyncd

./configure --prefix=/usr    \
            --disable-xxhash \
            --without-included-zlib 
make

make install

cat > /etc/rsyncd.conf << "EOF"
# This is a basic rsync configuration file
# It exports a single module without user authentication.

motd file = /home/rsync/welcome.msg
use chroot = yes

[localhost]
    path = /home/rsync
    comment = Default rsync module
    read only = yes
    list = yes
    uid = rsyncd
    gid = rsyncd

EOF