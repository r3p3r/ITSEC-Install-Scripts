#!/bin/bash


bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}
 __  __ ___ _____ __  __ _____ 
|  \/  |_ _|_   _|  \/  |  ___|
| |\/| || |  | | | |\/| | |_   
| |  | || |  | | | |  | |  _|  
|_|  |_|___| |_| |_|  |_|_|    
                                    
${normal}"

GITREPOROOT=/opt/ITSEC/7.Mitm/mitmf/byt3bl33d3r/MITMf
GITREPOGITFILE=$GITREPOROOT/.git
DSKTPFLS=/opt/ITSEC-Install-Scripts/0.Initial/usrlcl/.local/share/applications/7.Mitm
DSKTPFLSDEST=/home/$USER/.local/share/applications/7.Mitm
DSKTPFL=mitmf.desktop


if [ ! -d $GITREPOGITFILE ]

then
mkdir -p /opt/ITSEC/7.Mitm/mitmf/byt3bl33d3r
cd /opt/ITSEC/7.Mitm/mitmf/byt3bl33d3r
git clone https://github.com/byt3bl33d3r/MITMf.git

else

echo "repo exists"

fi

cd $GITREPOROOT

if git diff-index --quiet HEAD --; then
    echo "UP TO DATE"

else
sudo -H pip2 install virtualenvwrapper

sudo ldconfig
sudo udpatedb

cd $GITREPOROOT
git clean -f 
git fetch origin
git reset --hard origin/master
git pull
git submodule init
git submodule update --recursive
 
sudo -H pip2 install -r requirements.txt

echo '#!/bin/bash 

cd /opt/ITSEC/7.Mitm/mitmf/byt3bl33d3r/MITMf

python mitmf.py "$@"' > mitmf.sh

chmod +x mitmf.sh
sudo rm -f /usr/local/bin/mitmf
sudo ln -s /opt/ITSEC/7.Mitm/mitmf/byt3bl33d3r/MITMf/mitmf.sh /usr/local/bin/mitmf
rm -f $DSKTPFLSDEST/$DSKTPFL
mkdir -p $DSKTPFLSDEST
cp $DSKTPFLS/$DSKTPFL $DSKTPFLSDEST/$DSKTPFL

fi
