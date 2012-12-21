ALL: install.scr splash.img copy MLO.img

.PHONY: copy

clean:
	rm install.scr

copy: install.scr splash.img
	cp install.scr /srv/tftp/boot.scr
	cp splash.img files/splash.img

install.scr: install.cmds
	mkimage -A arm -T script -C none -n 'Install Script' -d $^ $@


splash8.bmp: splash.bmp
#	convert splash.bmp -colors 256 splash8.bmp

splash.img: splash.bmp
	mkimage -A arm -T kernel -C none -n 'splash' -d splash.bmp splash.img

MLO.img: ../u-boot/MLO
	mkimage -A arm -T kernel -C none -n 'MLO' -d ../u-boot/MLO MLO.img
