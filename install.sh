#! /bin/bash

txtrst=$(tput sgr0)     # Reset text color
txtred=$(tput setaf 1)  # Make text red
txtgrn=$(tput setaf 2)  # Make text green

cd /usr
sudo wget --content-disposition https://pithos.okeanos.grnet.gr/public/vz6zt 	#Download nxclient
sudo wget --content-disposition https://pithos.okeanos.grnet.gr/public/g6k63	#Download nxnode
sudo wget --content-disposition https://pithos.okeanos.grnet.gr/public/2m8ns	#Download nxserver

sudo tar zxvf nxclient-3.5.0-7.x86_64.tar.gz 
sudo tar zxvf nxnode-3.5.0-9.x86_64.tar.gz 
sudo tar zxvf nxserver-3.5.0-11.x86_64.tar.gz

sudo /usr/NX/scripts/setup/nxnode --install 
sudo /usr/NX/scripts/setup/nxserver --install

if [[ -e /etc/init.d/nxserver ]]; then
	echo "${txtgrn}NX Server seems to have been installed successfully${txtrst}"
else
	echo "${txtred}Installation failed${txtrst}"
fi
