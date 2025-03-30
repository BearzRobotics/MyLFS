
export QT6PREFIX=/usr
cd qtwebengine/

sed -e '189 s/=/& false/' \
    -e '190 d'            \
    -i.orig src/3rdparty/chromium/third_party/webrtc/webrtc.gni

mkdir build &&
cd    build &&

cmake -D CMAKE_MESSAGE_LOG_LEVEL=STATUS             \
      -D QT_FEATURE_webengine_system_ffmpeg=ON      \
      -D QT_FEATURE_webengine_system_icu=ON         \
      -D QT_FEATURE_webengine_system_libevent=ON    \
      -D QT_FEATURE_webengine_proprietary_codecs=ON \
      -D QT_FEATURE_webengine_webrtc_pipewire=ON    \
      -D QT_BUILD_EXAMPLES_BY_DEFAULT=OFF           \
      -G Ninja .. &&

ninja

ninja install

cat >> /root/dknotes << "EOF"
Qt6Web
===========================================================
If a browser using this package fails to run and when run 
from a term it reports 'Trace/breakpoint trap' that is 
probably a kernel configuration issue - there is no need to 
rebuild QtWebEngine, see the next section, recompile the kernel 
and reboot to the new kernel.

This package does not require any of the optional kernel 
namespace items, but if User namespace is enabled PID 
namespace must also be enabled. In that case enable the 
following options in the kernel configuration and recompile 
the kernel if necessary:

General setup --->
  -*- Namespaces support --->                                       [NAMESPACES]
    # Enable or disable *both* of them:
    [ /*] User namespace                                               [USER_NS]
    [ /*] PID Namespaces                                                [PID_NS]

EOF
