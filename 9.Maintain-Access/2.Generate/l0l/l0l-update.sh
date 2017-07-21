#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _     ___  _     
| |   / _ \| |    
| |  | | | | |    
| |__| |_| | |___ 
|_____\___/|_____|
                
${normal}"


mkdir -p /opt/ITSEC/9.Maintain-Access/2.Generate/l0l/m3pt0r
cd /opt/ITSEC/9.Maintain-Access/2.Generate/l0l/m3pt0r
git clone https://github.com/m3pt0r/l0l

GITREPOROOT=/opt/ITSEC/9.Maintain-Access/2.Generate/l0l/m3pt0r/l0l
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/9.Maintain-Access/2.Generate
DSKTPFLSDEST=/home/$USER/.local/share/applications/9.Maintain-Access/2.Generate
DSKTPFL=l0l.desktop

cd $GITREPOROOT
sudo make uninstall
make clean
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init && git submodule update --recursive
make -j 4
sudo make install
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL