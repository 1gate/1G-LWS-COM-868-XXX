#!/bin/bash

echo "Install LoRaWAN Server"

# Stop on the first sign of trouble
set -e

# Create the required lorawan-server directory for Mnesia database and log files
LORAWAN_HOME="/home/ogate/lorawan-server"
if [ ! -d "$LORAWAN_HOME" ]
then
mkdir $LORAWAN_HOME
chown ogate:ogate $LORAWAN_HOME
chmod a+rwx $LORAWAN_HOME
fi

# Download and install debian package 
wget https://github.com/gotthardp/lorawan-server/releases/download/v0.4.13/lorawan-server_0.4.13_all.deb
dpkg -i lorawan-server_0.4.13_all.deb

echo "Installation completed."

# Start lorawan server as a service

#sed -i -e "s/Environment=LORAWAN_HOME=\/var\/lib\/lorawan-server/Environment=LORAWAN_HOME=\/home\/ogate\/lorawan-server/g" /lib/systemd/system/lorawan-server.service
systemctl enable lorawan-server.service

#echo "The system will reboot in 5 seconds..."
#sleep 5
#shutdown -r now
