#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 _____ _____ ____  _   _ 
|  ___| ____|  _ \| \ | |
| |_  |  _| | |_) |  \| |
|  _| | |___|  _ <| |\  |
|_|   |_____|_| \_\_| \_|
          
${normal}"

GITREPOROOT=/opt/ITSEC/6.Wireless/1.Wifi/fern-wifi-cracker/savio-code/fern-wifi-cracker/Fern-Wifi-Cracker
GITREPOGITFILE=$GITREPOROOT/.git
EXECUTEABLE1=execute.py
EXECUTEABLE2=fern-wifi-cracker

DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/6.Wireless/1.Wifi
DSKTPFLSDEST=/home/$USER/.local/share/applications/6.Wireless/1.Wifi
DSKTPFL=fern-wifi-cracker.desktop


if [ ! -d $GITREPOGITFILE ]

then

mkdir -p /opt/ITSEC/6.Wireless/1.Wifi/fern-wifi-cracker/savio-code
cd /opt/ITSEC/6.Wireless/1.Wifi/fern-wifi-cracker/savio-code
git clone https://github.com/savio-code/fern-wifi-cracker.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else

cd $GITREPOROOT
sudo rm -f /usr/local/bin/$EXECUTEABLE2
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
echo "#!/bin/bash 

cd /opt/ITSEC/6.Wireless/1.Wifi/fern-wifi-cracker/savio-code/fern-wifi-cracker/Fern-Wifi-Cracker

sudo python execute.py" > $EXECUTEABLE2
sudo chmod +x $EXECUTEABLE1
sudo chmod +x $EXECUTEABLE2
sudo ln -s $GITREPOROOT/$EXECUTEABLE2 /usr/local/bin/$EXECUTEABLE2
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi