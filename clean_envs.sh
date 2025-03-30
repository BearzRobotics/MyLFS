# My LFS build has a lot of env that poplute the build
# This is to launch a bash shell with only the essentials
# set.
env -i HOME=/root TERM=xterm PS1='(lfs clean) \u:\w\$ ' PATH=/usr/bin:/usr/sbin MAKEFLAGS="-j$(nproc)" /bin/bash  --noprofile --norc