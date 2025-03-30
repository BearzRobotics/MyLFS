# /etc/profile has the pathappend function in
# plus /etc/profile.d/xorg.sh has our x environment variables
# which is soruced by /etc/profile
source /etc/profile

# Can not build without X org
export CPLUS_INCLUDE_PATH=/usr/include/c++/14.2.0/:/usr/include

export CPPFLAGS="-I/usr/include/harfbuzz"
export LDFLAGS="-lharfbuzz"

unset JAVA_HOME                             &&
unset CLASSPATH                             &&
unset MAKEFLAGS                             &&
bash configure --enable-unlimited-crypto    \
               --disable-warnings-as-errors \
               --with-stdc++lib=dynamic     \
               --with-giflib=system         \
               --with-harfbuzz=bundled       \
               --with-lcms=system           \
               --with-libjpeg=system        \
               --with-libpng=system         \
               --with-zlib=system           \
               --with-version-build="7"     \
               --with-version-pre=""        \
               --with-version-opt=""        \
               --with-jobs=$(nproc)         \
               --with-cacerts-file=/etc/pki/tls/java/cacerts &&
make images

export JT_JAVA=$(echo $PWD/build/*/jdk) &&
jtreg/bin/jtreg -jdk:$JT_JAVA -automatic -ignore:quiet -v1 \
    test/jdk:tier1 test/langtools:tier1 &&
unset JT_JAVA

install -vdm755 /opt/jdk-23.0.2+7             &&
cp -Rv build/*/images/jdk/* /opt/jdk-23.0.2+7 &&
chown -R root:root /opt/jdk-23.0.2+7          &&
for s in 16 24 32 48; do
  install -vDm644 src/java.desktop/unix/classes/sun/awt/X11/java-icon${s}.png \
                  /usr/share/icons/hicolor/${s}x${s}/apps/java.png
done


ln -v -nsf /opt/jdk-23.0.2+7 /opt/jdk

mkdir -pv /usr/share/applications &&

cat > /usr/share/applications/openjdk-java.desktop << "EOF" &&
[Desktop Entry]
Name=OpenJDK Java 23.0.2 Runtime
Comment=OpenJDK Java 23.0.2 Runtime
Exec=/opt/jdk/bin/java -jar
Terminal=false
Type=Application
Icon=java
MimeType=application/x-java-archive;application/java-archive;application/x-jar;
NoDisplay=true
EOF
cat > /usr/share/applications/openjdk-jconsole.desktop << "EOF"
[Desktop Entry]
Name=OpenJDK Java 23.0.2 Console
Comment=OpenJDK Java 23.0.2 Console
Keywords=java;console;monitoring
Exec=/opt/jdk/bin/jconsole
Terminal=false
Type=Application
Icon=java
Categories=Application;System;
EOF

mkdir -pv /opt/jdk/lib/security/
ln -sfv /etc/pki/tls/java/cacerts /opt/jdk/lib/security/cacerts