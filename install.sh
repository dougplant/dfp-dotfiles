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

yum -y install vim-enhanced

cd "$homefolder"

if [ ! -d "$homefolder/dfp-dotfiles" ]
then
   git clone https://github.com/dougplant/dfp-dotfiles.git
   chown -R $plainuser:$plainuser dfp-dotfiles/
fi

echo "alias dfp='. $homefolder/dfp-dotfiles/.bashrc_dfp'" >> .bashrc
echo "alias dfp='. $homefolder/dfp-dotfiles/.bashrc_dfp'" >> /root/.bashrc

alias vim="vim -u $homefolder/dfp-dotfiles/.vimrc" >> .bashrc
alias vi="vim -u $homefolder/dfp-dotfiles/.vimrc" >> .bashrc

alias vim="vim -u $homefolder/dfp-dotfiles/.vimrc" >> /root/.bashrc
alias vi="vim -u $homefolder/dfp-dotfiles/.vimrc" >> /root/.bashrc

