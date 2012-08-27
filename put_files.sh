#!/bin/sh

if [ $# -ne 1 ]; then
	echo "Usage: `basename $0` path"
	exit 1
fi

tg=$1
cp files/MLO $tg
cp files/MLO_falcon $tg
cp files/u-boot.img $tg
cp files/uImage $tg
cp files/ubifs.img $tg
cp files/splash.img $tg
cp install.scr $tg/boot.scr
