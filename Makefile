VERSION != egrep '^Version:' kayila-config.ctl | cut -d ' ' -f 2

all: deb

bootstrap:
	apt-add-repository -y contrib && dpkg --add-architecture i386
	dpkg --add-architecture i386
	apt install equivs

deb:
	./kayila-config.ctl

install: deb
	sudo apt install ./kayila-config_${VERSION}_all.deb

version:
	@echo ${VERSION}

clean:
	rm -f *.deb *.buildinfo *.changes

.PHONY: all deb install clean
