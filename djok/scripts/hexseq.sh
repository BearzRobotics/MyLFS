source /etc/profile

zig build
mv zig-out/bin/hexseq /usr/bin/hexseq

### Boot files


cat > /etc/rc.d/init.d/hexseq << "EOF"
#!/bin/sh
# /etc/rc.d/init.d/hexseq
# Simple log rotation at boot

### BEGIN INIT INFO
# Provides:          hexseq
# Required-Start:    mountkernfs
# Required-Stop:
# Default-Start:     S
# Default-Stop:
# Short-Description: Rotate logs early
### END INIT INFO

case "$1" in
    start)
        echo "Running hexseq log rotation"
        /usr/bin/hexseq -d --logdir /var/log

        # I don't know how to get rc.local to work
        dmesg > /var/log/dmesg
        ;;
    *)
        echo "Usage: $0 start"
        exit 1
        ;;
esac

exit 0

EOF

chmod +x /etc/rc.d/init.d/hexseq

# Link into early boot

# files run in order of the S00 on. so S05moduels will run 
# after S00mountvirtfs and before S08localnet
ln -sf ../init.d/hexseq /etc/rc.d/rcS.d/S41hexseq

# start it
/etc/rc.d/init.d/hexseq start


cat >> /root/dknotes << "EOF"
hexseq
===================================

This program should auto rotate your logs for you up to .FFF

I don't know how to get rc.local to work so for now I put
dmesg > /var/log/dmesg
to run after hexseq so that you get the new systems dmesg. Then on next
boot it will rename it.


EOF 