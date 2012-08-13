# update files
make
./get_files.sh
sudo ./rootfs2ubi.sh /opt/eldk-5.1/armv7a/rootfs-minimal/

# umount sdcard
sudo ./sdcard.sh /dev/mmcblk0

# mount the card
./put_files.sh /media/boot
umount /media/boot

If the current u-boot in the board does support a boot.scr it
will install the bpp3 by itself. Otherwise run it manually:

if fatload mmc 0 ${loadaddr} boot.scr; then; source ${loadaddr}; fi

# The install script can also be run over tftp, provided the files
# are named correctly on the tftp server / set correctly in the script.
if tftp 81000000 boot.scr; then; source 81000000; fi
