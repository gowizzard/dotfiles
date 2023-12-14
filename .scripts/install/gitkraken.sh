#!/bin/bash

# Install GitKraken latest version for linux x64 systems.

wget -O /tmp/gitkraken.tar.gz https://release.gitkraken.com/linux/gitkraken-amd64.tar.gz
if [ ! -f "/tmp/gitkraken.tar.gz" ]; then
    echo "Error while downloading GitKraken."
    exit 1
fi

sudo mkdir -p /opt/gitkraken
sudo tar -xzf /tmp/gitkraken.tar.gz -C /opt/gitkraken --strip-components=1
rm /tmp/gitkraken.tar.gz

if [ ! -L "/usr/local/bin/gitkraken" ]; then
    sudo ln -s /opt/gitkraken/gitkraken /usr/local/bin/gitkraken
fi

echo "GitKraken installation completed."