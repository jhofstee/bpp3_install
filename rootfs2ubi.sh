
if [ $# -ne 1 ]; then
	echo "Usage: `basename $0` rootfs"
	echo "e.g. sudo ./rootfs2ubi.sh /opt/eldk-5.1/armv7a/rootfs-minimal/"
	exit 1
fi

mkfs.ubifs -m 2048 -e 129024 -c 8152 -x lzo -U -v -r $1 -o files/ubifs.img
