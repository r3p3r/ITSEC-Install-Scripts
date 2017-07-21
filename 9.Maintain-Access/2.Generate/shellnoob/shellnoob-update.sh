#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 ____  _   _ _____ _     _   _  ___   ___  ____  
/ ___|| | | | ____| |   | \ | |/ _ \ / _ \| __ ) 
\___ \| |_| |  _| | |   |  \| | | | | | | |  _ \ 
 ___) |  _  | |___| |___| |\  | |_| | |_| | |_) |
|____/|_| |_|_____|_____|_| \_|\___/ \___/|____/ 
           
${normal}"

mkdir -p /opt/ITSEC/9.Maintain-Access/2.Generate/shellnoob/reyammer
cd /opt/ITSEC/9.Maintain-Access/2.Generate/shellnoob/reyammer
git clone https://github.com/reyammer/shellnoob

GITREPOROOT=/opt/ITSEC/9.Maintain-Access/2.Generate/shellnoob/reyammer/shellnoob
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/9.Maintain-Access/2.Generate
DSKTPFLSDEST=/home/$USER/.local/share/applications/9.Maintain-Access/2.Generate
DSKTPFL=shellnoob.desktop

cd $GITREPOROOT
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
sudo python shellnoob.py --install --force

rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL