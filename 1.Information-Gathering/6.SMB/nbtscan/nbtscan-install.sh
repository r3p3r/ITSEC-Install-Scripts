#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

reporoot=/opt/ITSEC/1.Information-Gathering/6.SMB/nbtscan/unixwiz.net
name=nbtscan-source-1.0.35
url=http://www.unixwiz.net/tools/nbtscan-source-1.0.35.tgz
#
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/6.SMB
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/6.SMB
DSKTPFL=nbtscan.desktop

echo "${bold}
 _   _ ____ _____ ____   ____    _    _   _ 
| \ | | __ )_   _/ ___| / ___|  / \  | \ | |
|  \| |  _ \ | | \___ \| |     / _ \ |  \| |
| |\  | |_) || |  ___) | |___ / ___ \| |\  |
|_| \_|____/ |_| |____/ \____/_/   \_\_| \_|
         
INSTALL
${normal}"

mkdir -p $reporoot

sudo udpatedb
sudo ldconfig

sudo rm -f /usr/local/bin/nbtscan

cd $reporoot

### DEPS:
# no deps noted, feel free to add ...
### DEPS END

#mkdir $name

wget $url
tar xvfz $name.tgz
sudo rm -f $name.tgz

#cd $name 
make -j 4
sudo ln -s $reporoot/nbtscan /usr/local/bin/nbtscan
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL
sudo updatedb

