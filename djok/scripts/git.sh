wget https://www.kernel.org/pub/software/scm/git/git-manpages-2.48.1.tar.xz

./configure --prefix=/usr \
            --with-gitconfig=/etc/gitconfig \
            --with-python=python3 &&
make

make perllibdir=/usr/lib/perl5/5.40/site_perl install

tar -xf git-manpages-2.48.1.tar.xz \
    -C /usr/share/man --no-same-owner --no-overwrite-dir