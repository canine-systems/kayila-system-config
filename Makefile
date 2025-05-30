CONF_FILE ?= kayila-config.ctl


PKG_NAME != egrep '^Package:' ${CONF_FILE} | cut -d ' ' -f 2
VERSION != egrep '^Version:' kayila-config.ctl | cut -d ' ' -f 2

DEB_FILE := $(PKG_NAME)_${VERSION}_all.deb


all: deb

bootstrap: install steam

deb: ${DEB_FILE}

${DEB_FILE}: ${CONF_FILE}
	which equivs-build || sudo apt install equivs
	equivs-build ${CONF_FILE}

install: TEMP_FILE != mktemp --suffix=.deb
install: deb
	cp ./${DEB_FILE} ${TEMP_FILE}
	chmod a+r ${TEMP_FILE}
	sudo apt install ${TEMP_FILE}
	rm -rf ${TEMP_FILE}

steam:
	sudo apt-add-repository -y contrib
	sudo dpkg --add-architecture i386
	sudo apt install steam-installer

version:
	@echo ${VERSION}

clean:
	rm -f *.deb *.buildinfo *.changes

.PHONY: all deb install clean
