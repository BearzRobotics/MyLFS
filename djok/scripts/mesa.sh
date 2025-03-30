# /etc/profile has the pathappend function in
# plus /etc/profile.d/xorg.sh has our x environment variables
# which is soruced by /etc/profile
source /etc/profile

export CPLUS_INCLUDE_PATH=/usr/include/c++/14.2.0/:/usr/include

wget https://www.linuxfromscratch.org/patches/blfs/12.3/mesa-add_xdemos-4.patch

patch -Np1 -i mesa-add_xdemos-4.patch

mkdir build &&
cd    build &&

meson setup ..                 \
      --prefix=$XORG_PREFIX    \
      --buildtype=release      \
      -D platforms=x11,wayland \
      -D gallium-drivers=auto  \
      -D vulkan-drivers=auto   \
      -D valgrind=disabled     \
      -D video-codecs=all      \
      -D libunwind=disabled    &&

ninja

ninja install

cp -rv ../docs -T /usr/share/doc/mesa-24.3.4

cat >> /root/dknotes << "EOF" 
Mesa
===========================================================
Device Drivers --->
  Graphics support --->
    <*/M> Direct Rendering Manager (XFree86 4.1.0 and higher DRI support) --->
                                                                      ...  [DRM]
      # For r300 or r600:
      < /*/M> ATI Radeon                                            [DRM_RADEON]
      # For radeonsi:
      < /*/M> AMD GPU                                               [DRM_AMDGPU]
      [*]       Enable amdgpu support for SI parts               [DRM_AMDGPU_SI]
      [*]       Enable amdgpu support for CIK parts             [DRM_AMDGPU_CIK]
        Display Engine Configuration --->
        [*]   AMD DC - Enable new display engine                    [DRM_AMD_DC]
      # For nouveau:
      < /*/M> Nouveau (NVIDIA) cards                               [DRM_NOUVEAU]
      [*]       Use GSP firmware for Turing/Ampere (needs firmware installed)
                                                  ...  [DRM_NOUVEAU_GSP_DEFAULT]
      # For i915, crocus, or iris:
      < /*/M> Intel 8xx/9xx/G3x/G4x/HD Graphics                       [DRM_I915]
      # For llvmpipe or softpipe:
      < /*>   Virtual GEM provider                                    [DRM_VGEM]
      # For svga:
      < /*/M> DRM driver for VMware Virtual GPU                     [DRM_VMWGFX]
EOF