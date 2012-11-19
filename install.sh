#! /bin/bash

txtrst=$(tput sgr0)     # Reset text color
txtred=$(tput setaf 1)  # Make text red
txtgrn=$(tput setaf 2)  # Make text green

UBUNTU_DISTRO=`cat /etc/*-release | grep 'Ubuntu'`
FEDORA_DISTRO=`cat /etc/*-release | grep 'Fedora'`

if [[ -n $UBUNTU_DISTRO ]]; then
	sudo -s
elif [[ -n $FEDORA_DISTRO ]]; then
	su
else

cd /usr
wget --content-disposition https://pithos.okeanos.grnet.gr/public/vz6zt 	#Download nxclient
wget --content-disposition https://pithos.okeanos.grnet.gr/public/g6k63	#Download nxnode
wget --content-disposition https://pithos.okeanos.grnet.gr/public/2m8ns	#Download nxserver

tar zxvf nxclient-3.5.0-7.x86_64.tar.gz 
tar zxvf nxnode-3.5.0-9.x86_64.tar.gz 
tar zxvf nxserver-3.5.0-11.x86_64.tar.gz

/usr/NX/scripts/setup/nxnode --install 
/usr/NX/scripts/setup/nxserver --install

if [[ -e /etc/init.d/nxserver ]]; then
	echo "${txtgrn}NX Server seems to have been installed successfully${txtrst}"
else
	echo "${txtred}Installation failed${txtrst}"
fi
