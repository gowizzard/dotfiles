#!/bin/bash

# Install GitKraken latest version for linux x64 systems.

if [ -d "/opt/code" ]; then
    read -p "Visual Studio Code is already installed. Do you want to update it? [Y/n] " answer
    if [[ "$answer" =~ ^[Yy](es)?$ ]]; then
        sudo rm -rf /opt/code
    else
        exit 1
    fi
fi

wget -O /tmp/code.tar.gz https://code.visualstudio.com/sha/download?build=stable&os=linux-x64
if [ ! -f "/tmp/code.tar.gz" ]; then
    echo "Error while downloading Visual Studio Code."
    exit 1
fi

sudo mkdir -p /opt/code
sudo tar -xzf /tmp/code.tar.gz -C /opt/code --strip-components=1
rm /tmp/code.tar.gz

if [ ! -L "/usr/local/bin/code" ]; then
    sudo ln -s /opt/code/code /usr/local/bin/code
fi

echo "Visual Sturio Code installation completed."