#!/bin/bash

# note, this only formats the SD card, no files are put on it.
if [ $# -ne 1 ]; then
	echo "Usage: `basename $0` dev"
	exit 1
fi

if [ ! "$1" = "/dev/sda" ] ; then
	unset LANG
	DRIVE=$1
	if [ -b "$DRIVE" ] ; then
		#dd if=/dev/zero of=$DRIVE bs=1024k count=800
		SIZE=`fdisk -l $DRIVE | grep Disk | awk '{print $5}'`
		if [[ $SIZE == "" ]]; then
			exit -1
		fi
		echo "DISK SIZE - $SIZE bytes"
		CYLINDERS=`echo $SIZE/255/63/512 | bc`

		echo CYLINDERS - $CYLINDERS
		{
			#echo ,90,0x0C,*
			#cho ,,,-
			echo ,,b,*
		} | sfdisk -D -H 255 -S 63 -C $CYLINDERS $DRIVE
		mkfs.vfat -F 32 -n "boot" ${DRIVE}p1
		#mke2fs -j -L "rootfs" ${DRIVE}2
	fi
fi
