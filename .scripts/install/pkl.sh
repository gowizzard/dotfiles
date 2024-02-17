#!/bin/bash

# Install pkl latest version for linux x64 systems.

if [ -x "$(command -v pkl)" ]; then
    read -p "pkl is already installed. Do you want to update it? [Y/n] " answer
    if [[ "$answer" =~ ^[Yy](es)?$ ]]; then
        sudo rm -rf /usr/local/bin/pkl
    else
        exit 1
    fi
fi

wget -O /tmp/pkl https://github.com/apple/pkl/releases/download/0.25.2/pkl-linux-amd64
if [ ! -f "/tmp/pkl" ]; then
    echo "Error while downloading pkl."
    exit 1
fi

chmod +x /tmp/pkl
sudo cp /tmp/pkl /usr/local/bin
rm /tmp/pkl

echo "pkl installation completed."