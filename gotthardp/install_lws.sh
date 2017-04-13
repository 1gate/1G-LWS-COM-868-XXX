#!/bin/bash

echo "Install LoRaWAN Server"

# Stop on the first sign of trouble
set -e

# Create the required install directory and make sure it is clean
INSTALL_DIR="/usr/lib/lorawan-server"
if [ ! -d "$INSTALL_DIR" ]; then mkdir $INSTALL_DIR; fi
pushd $INSTALL_DIR
rm -rf *

# Install 
wget https://github.com/gotthardp/lorawan-server/releases/download/v0.3.0/lorawan-server-0.3.0.tar.gz
tar -zxvf lorawan-server-0.3.0.tar.gz

echo "Installation completed."

# Start lorawan server as a service
cp bin/lorawan-server.service /lib/systemd/system/
adduser --home /var/lib/lorawan-server lorawan
passwd -d lorawan
systemctl enable lorawan-server.service

echo "The system will reboot in 5 seconds..."
sleep 5
shutdown -r now
