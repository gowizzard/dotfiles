#!/bin/bash

# Install postman latest version for linux x64 systems.

if [ -d "/opt/postman" ]; then
    echo "Postman is already installed."
    exit 1
fi


wget -O /tmp/postman.tar.gz https://dl.pstmn.io/download/latest/linux_64 
if [ ! -f "/tmp/postman.tar.gz" ]; then
    echo "Error while downloading Postman."
    exit 1
fi

sudo mkdir -p /opt/postman
sudo tar -xzf /tmp/postman.tar.gz -C /opt/postman --strip-components=1
rm /tmp/postman.tar.gz

if [ ! -L "/usr/local/bin/postman" ]; then
    sudo ln -s /opt/postman/Postman /usr/local/bin/postman
fi

echo "Postman installation completed."