#!/bin/bash

# run (as root) like: bash install.sh readerbound

if [[ "$EUID" -ne 0 ]]; then
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

yum -y install vim-enhanced

cd "$homefolder"

## rm -rf dfp-dotfiles
##  git clone https://github.com/dougplant/dfp-dotfiles.git
## chown -R $plainuser:$plainuser dfp-dotfiles/

# sed -i '/^alias dfp/d' .bashrc
echo "alias dfp='. $homefolder/dfp-dotfiles/.bashrc_dfp'" >> $homefolder/.bashrc

# sed -i '/^alias dfp/d' /root/.bashrc
echo "alias dfp='. $homefolder/dfp-dotfiles/.bashrc_dfp'" >> /root/.bashrc

# create symlink so that the vi/vim aliases point at the single vimrc file
cd /root
rm -f dfp-dotfiles
ln -s /home/readerbound/dfp-dotfiles/
