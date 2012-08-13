ALL: install.scr copy

.PHONY: copy

clean:
	rm install.scr

copy: install.scr
	cp install.scr /srv/tftp/boot.scr

install.scr: install.cmds
	mkimage -A arm -T script -C none -n 'Install Script' -d $^ $@
