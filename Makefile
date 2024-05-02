VERSION != egrep '^Version:' kayila-config.ctl | cut -d ' ' -f 2

all: deb

deb:
	./kayila-config.ctl

install: deb
	sudo apt install ./kayila-config_${VERSION}_all.deb

version:
	@echo ${VERSION}

clean:
	rm -f *.deb *.buildinfo *.changes

.PHONY: all deb install clean
