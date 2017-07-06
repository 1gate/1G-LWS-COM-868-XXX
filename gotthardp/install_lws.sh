#!/bin/bash

echo "Install LoRaWAN Server"

# Stop on the first sign of trouble
set -e

# Download and install debian package 
wget https://github.com/gotthardp/lorawan-server/releases/download/v0.4.6/lorawan-server_0.4.6_all.deb
dpkg -i lorawan-server_0.4.6_all.deb

echo "Installation completed."

# Start lorawan server as a service

systemctl enable lorawan-server.service

echo "The system will reboot in 5 seconds..."
sleep 5
shutdown -r now
