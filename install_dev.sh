#!/bin/bash

# First install basic requirements (and only continue if they are complete)
if ! ./install.sh
then
  exit 1
fi

# Install extra packages
apt-get -y install vim curl htop tmux

# Install fish shell
wget -nv https://download.opensuse.org/repositories/shells:fish:release:2/Debian_9.0/Release.key -O Release.key
apt-key add - < Release.key
rm Release.key
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_9.0/ /' > /etc/apt/sources.list.d/fish.list 
apt-get -y update
apt-get -y install fish

