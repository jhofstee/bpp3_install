ALL: install.scr splash.img copy

.PHONY: copy

clean:
	rm install.scr

copy: install.scr splash.img
	cp install.scr /srv/tftp/boot.scr
	cp splash.img files/splash.img

install.scr: install.cmds
	mkimage -A arm -T script -C none -n 'Install Script' -d $^ $@


splash8.bmp: splash.bmp
	convert splash.bmp -colors 256 splash8.bmp

splash.img: splash8.bmp
	mkimage -A arm -T kernel -C none -n 'splash' -d splash8.bmp splash.img
