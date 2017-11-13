#!/bin/bash

# First install basic requirements (and only continue if they are complete)
if ! ./install.sh
then
  exit 1
fi

# Install extra packages
apt-get -y install vim curl htop tmux tcpdump

# Install fish shell
wget -nv https://download.opensuse.org/repositories/shells:fish:release:2/Debian_9.0/Release.key -O Release.key
apt-key add - < Release.key
rm Release.key
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_9.0/ /' > /etc/apt/sources.list.d/fish.list 
apt-get -y update
apt-get -y install fish
curl -L https://get.oh-my.fish | fish
echo "omf install bobthefish" | fish
echo "omf theme bobthefish" | fish
echo "omf reload" | fish
echo "Fish is installed and ready to use. Configure a Nerd Powerline font for your terminal and run 'fish'."
