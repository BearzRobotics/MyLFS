# #######################
# LFS Build Configuration
# ~~~~~~~~~~~~~~~~~~~~~~~

FULLPATH=$(cd $(dirname $0) && pwd)

export LFS_VERSION=12.2
export KERNELVERS=6.10.5
export PACKAGE_LIST=$FULLPATH/packages.sh
export PACKAGE_DIR=$FULLPATH/packages
export LOG_DIR=$FULLPATH/logs
export KEEP_LOGS=true
export LFS=$FULLPATH/mnt/lfs
export INSTALL_MOUNT=$FULLPATH/mnt/install
export LFS_TGT=$(uname -m)-lfs-linux-gnu
export LFS_FS=ext4
export LFS_IMG=$FULLPATH/lfs.img
export LFS_IMG_SIZE=$((80*1024*1024*1024)) # 60 GiB
export TESTLOG_DIR=$FULLPATH/testlogs
export LFSROOTLABEL=LFSROOT
export LFSEFILABEL=LFSEFI
export LFSFSTYPE=ext4

# configure these like `MAKEFLAGS=-j1 RUN_TESTS=true ./mylfs.sh --build-all`
export MAKEFLAGS=${MAKEFLAGS:--j8}
export RUN_TESTS=${RUN_TESTS:-false}
export ROOT_PASSWD=x
export LFSHOSTNAME=${LFSHOSTNAME:-lfs}

# For creating a pure MS-DOS boot
export FDISK_INSTR="
o       # create DOS partition table
n       # new partition
        # default partition type (primary)
        # default partition number (1)
        # default partition start
        # default partition end (max)
y       # confirm overwrite (noop if not prompted)
w       # write to device and quit
"

# For creating a mix DOS/UEFI boot system
export EFI_FDISK_INSTR="
g       # create GPT partition table
n       # new partition (BIOS boot)
1       # partition number
        # default start
+2M     # 2MB for BIOS boot
t       # change type
1       # partition 1
4       # type 4 = BIOS boot (EF02)
n       # new partition (EFI system)
2
        # default start
+500M
t
2
1       # type 1 = EFI System (EF00)
n       # new partition (swap)
3
        # default start
+4G
t
3
19      # type 19 = Linux swap
n       # new partition (LFS root)
4
        # default start
        # default end (use rest of disk)
w       # write table and exit
"

# KEYS deterime how to build. If you want an EFI setup change the last option
# from FDISK_INSTR to EFI_FDISK_INSTR
KEYS="MAKEFLAGS PACKAGE_LIST PACKAGE_DIR LOG_DIR KEEP_LOGS LFS LFS_TGT"\
" LFS_FS LFS_IMG LFS_IMG_SIZE ROOT_PASSWD RUN_TESTS TESTLOG_DIR LFSHOSTNAME"\
" LFSROOTLABEL LFSEFILABEL LFSFSTYPE KERNELVERS FDISK_INSTR"

for KEY in $KEYS
do
    if [ -z "${!KEY}" ]
    then
        echo "ERROR: '$KEY' config is not set."
        exit -1
    fi
done


