VERSION != egrep '^Version:' kayila-config.ctl | cut -d ' ' -f 2

all: deb

bootstrap: install steam

deb:
	which equivs-build || sudo apt install equivs
	./kayila-config.ctl

install: deb
	sudo apt install ./kayila-config_${VERSION}_all.deb

steam:
	sudo apt-add-repository -y contrib
	sudo dpkg --add-architecture i386
	sudo apt install steam-installer

version:
	@echo ${VERSION}

clean:
	rm -f *.deb *.buildinfo *.changes

.PHONY: all deb install clean
