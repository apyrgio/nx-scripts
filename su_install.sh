#! /bin/bash

cd /usr
wget --content-disposition https://pithos.okeanos.grnet.gr/public/vz6zt #Download nxclient
wget --content-disposition https://pithos.okeanos.grnet.gr/public/g6k63	#Download nxnode
wget --content-disposition https://pithos.okeanos.grnet.gr/public/2m8ns	#Download nxserver

tar zxvf nxclient-3.5.0-7.x86_64.tar.gz
tar zxvf nxnode-3.5.0-9.x86_64.tar.gz
tar zxvf nxserver-3.5.0-11.x86_64.tar.gz

/usr/NX/scripts/setup/nxnode --install
/usr/NX/scripts/setup/nxserver --install

