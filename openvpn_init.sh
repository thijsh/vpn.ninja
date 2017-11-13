#!/bin/bash

# Warning
echo "WARNING: this wil overwrite any existing CA keys!" 
read -rsp $'Press enter to continue...\n'

# Fix path
[[ ":$PATH:" != *":/usr/sbin:"* ]] && PATH="/usr/sbin:${PATH}"

# Init the CA
ln -s -f $EASY_RSA/openssl-1.0.0.cnf $EASY_RSA/openssl.cnf
make-cadir ~/openvpn-ca
cd ~/openvpn-ca
source vars
./clean-all
./build-ca
./build-key-server server
./build-dh
openvpn --genkey --secret keys/ta.key

# Generate a client certificate
./build-key test

# Install server keys
cd ~/openvpn-ca/keys
sudo cp ca.crt server.crt server.key ta.key dh2048.pem /etc/openvpn




