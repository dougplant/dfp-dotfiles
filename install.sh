#!/bin/bash

# run (as root) like: bash install.sh readerbound

if [[ $EUID -ne 0 ]]; then
   echo "This has to be run as root" 
   exit 1
fi

plainuser="$1"

homefolder="/home/$plainuser"

if [ ! -d "$homefolder" ] 
then
    echo "Home folder does not exist: "$homefolder 
    exit 1
fi

echo "intalling vim"
yum -y install vim-enhanced

cd "$homefolder"

if [ ! -d "$homefolder/dfp-dotfiles" ]
then
   git clone https://github.com/dougplant/dfp-dotfiles.git
fi

echo "setting perms on the dfp dotfiles"
chown -R $plainuser:$plainuser dfp-dotfiles/

echo "setting up the 'dfp' aliases"
# sed -i '/^alias dfp/d' .bashrc
echo "alias dfp='. $homefolder/dfp-dotfiles/.bashrc_dfp'" >> .bashrc

# sed -i '/^alias dfp/d' /root/.bashrc
echo "alias dfp='. $homefolder/dfp-dotfiles/.bashrc_dfp'" >> /root/.bashrc

# create symlink so that the vi/vim aliases point at the single vimrc file
echo "setting up the root symlink"
cd /root
rm -f dfp-dotfiles
ln -s /home/readerbound/dfp-dotfiles/
