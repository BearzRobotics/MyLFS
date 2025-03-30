install -vdm755 /opt/OpenJDK-23.0.2-bin &&
mv -v * /opt/OpenJDK-23.0.2-bin         &&
chown -R root:root /opt/OpenJDK-23.0.2-bin

ln -sfnv /opt/OpenJDK-23.0.2-bin /opt/jdk

cat > /etc/profile.d/openjdk.sh << "EOF"
# Begin /etc/profile.d/openjdk.sh

# Set JAVA_HOME directory
JAVA_HOME=/opt/jdk

# Adjust PATH
export PATH=$JAVA_HOME/bin:$PATH

# Auto Java CLASSPATH: Copy jar files to, or create symlinks in, the
# /usr/share/java directory.

AUTO_CLASSPATH_DIR=/usr/share/java

pathprepend . CLASSPATH

for dir in `find ${AUTO_CLASSPATH_DIR} -type d 2>/dev/null`; do
    pathappend $dir CLASSPATH
done

for jar in `find ${AUTO_CLASSPATH_DIR} -name "*.jar" 2>/dev/null`; do
    pathappend $jar CLASSPATH
done

export JAVA_HOME

# By default, Java creates several files in a directory named
# /tmp/hsperfdata_[username]. This directory contains files that are used for
# performance monitoring and profiling, but aren't normally needed on a BLFS
# system. This environment variable disables that feature.
_JAVA_OPTIONS="-XX:-UsePerfData"

export _JAVA_OPTIONS

unset AUTO_CLASSPATH_DIR dir jar _JAVA_OPTIONS

# End /etc/profile.d/openjdk.sh
EOF

cat > /etc/sudoers.d/java << "EOF"
Defaults env_keep += JAVA_HOME
Defaults env_keep += CLASSPATH
Defaults env_keep += _JAVA_OPTIONS
EOF

cat >> /etc/man_db.conf << "EOF" &&
# Begin Java addition
MANDATORY_MANPATH     /opt/jdk/man
MANPATH_MAP           /opt/jdk/bin     /opt/jdk/man
MANDB_MAP             /opt/jdk/man     /var/cache/man/jdk
# End Java addition
EOF

mkdir -p /var/cache/man &&
mandb -c /opt/jdk/man
mkdir -vp /opt/jdk/lib/security/

ln -sfv /etc/pki/tls/java/cacerts /opt/jdk/lib/security/cacerts