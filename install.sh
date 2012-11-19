#! /bin/bash

txtrst=$(tput sgr0)     # Reset text color
txtred=$(tput setaf 1)  # Make text red
txtgrn=$(tput setaf 2)  # Make text green

UBUNTU_DISTRO=`cat /etc/*-release | grep 'Ubuntu'`
FEDORA_DISTRO=`cat /etc/*-release | grep 'Fedora'`

if [[ -n $UBUNTU_DISTRO ]]; then
	sudo -s "./su_install.sh"
elif [[ -n $FEDORA_DISTRO ]]; then
	su "./su_install.sh"
else
	echo "${txtred}Distro not supported.${txtrst}"
	exit 1
fi

if [[ -e /etc/init.d/nxserver ]]; then
	echo "${txtgrn}NX Server seems to have been installed successfully${txtrst}"
else
	echo "${txtred}Installation failed${txtrst}"
fi


