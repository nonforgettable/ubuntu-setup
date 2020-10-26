#!/bin/bash

### ensure script is run as root/sudo
if ! [ $(id -u) = 0 ]; then
    if [ "$1" ]; then
        echo "Error: need sudo"
        exit 1
    fi
    sudo sh $0 "1"
    exit $?
fi
 
 
### install stuff
apt update
apt upgrade
apt install snapd zsh dconf-editor git curl
wget -O /tmp/discord-installer.deb "https://discordapp.com/api/download/canary?platform=linux&format=deb"
dpkg -i /tmp/discord-installer.deb



### setup zsh with ohmyzsh and powerlevel10k
zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
nano ~/.zshrc
sudo reboot
