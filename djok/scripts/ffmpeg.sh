wget https://www.linuxfromscratch.org/patches/blfs/12.3/ffmpeg-7.1-chromium_method-1.patch
wget https://www.linuxfromscratch.org/patches/blfs/12.3/ffmpeg-7.1-texinfo_fix-1.patch


patch -Np1 -i ffmpeg-7.1-chromium_method-1.patch

sed -e 's/X265_BUILD >= 210/(&) \&\& (X265_BUILD < 213)/' \
    -i libavcodec/libx265.c

patch -Np1 -i ffmpeg-7.1-texinfo_fix-1.patch

./configure --prefix=/usr        \
            --enable-gpl         \
            --enable-version3    \
            --enable-nonfree     \
            --disable-static     \
            --enable-shared      \
            --disable-debug      \
            --enable-libaom      \
            --enable-libass      \
            --enable-libfdk-aac  \
            --enable-libfreetype \
            --enable-libmp3lame  \
            --enable-libopus     \
            --enable-libvorbis   \
            --enable-libvpx      \
            --enable-libx264     \
            --enable-libx265     \
            --enable-openssl     \
            --ignore-tests=enhanced-flv-av1 \
            --docdir=/usr/share/doc/ffmpeg-7.1 &&

make &&

gcc tools/qt-faststart.c -o tools/qt-faststart

make install &&

install -v -m755    tools/qt-faststart /usr/bin &&
install -v -m755 -d           /usr/share/doc/ffmpeg-7.1 &&
install -v -m644    doc/*.txt /usr/share/doc/ffmpeg-7.1