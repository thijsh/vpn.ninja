#!/bin/bash

# Check for root
if [[ $EUID -ne 0 ]]; then
   echo "Run this script as root" 
   exit 1
fi

# Install requirements
apt-get -y update
apt-get -y upgrade
apt-get -y dist-upgrade
apt-get -y install git openvpn easy-rsa
apt-get -y autoremove


