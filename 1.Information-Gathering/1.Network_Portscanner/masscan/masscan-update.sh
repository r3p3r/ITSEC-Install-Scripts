#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 __  __    _    ____ ____   ____    _    _   _ 
|  \/  |  / \  / ___/ ___| / ___|  / \  | \ | |
| |\/| | / _ \ \___ \___ \| |     / _ \ |  \| |
| |  | |/ ___ \ ___) |__) | |___ / ___ \| |\  |
|_|  |_/_/   \_\____/____/ \____/_/   \_\_| \_|
        
UPDATE
${normal}"

GITREPOROOT=/opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/masscan/robertdavidgraham/masscan
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/1.Information-Gathering/1.Network_Portscanner
DSKTPFLSDEST=/home/$USER/.local/share/applications/1.Information-Gathering/1.Network_Portscanner
DSKTPFL=masscan.desktop

if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/masscan/robertdavidgraham
cd /opt/ITSEC/1.Information-Gathering/1.Network_Portscanner/masscan/robertdavidgraham
git clone https://github.com/robertdavidgraham/masscan.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

cd $GITREPOROOT
sudo make uninstall
make clean
git clean -f
git fetch origin
git reset --hard origin/master
git pull
git submodule init 
git submodule update --recursive
make -j 4
sudo make install
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi


