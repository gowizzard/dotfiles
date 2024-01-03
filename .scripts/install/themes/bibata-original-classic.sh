#!/bin/bash

# Install Bibata Original Classic cursor theme.

if [ -d "/usr/share/icons/Bibata-Original-Classic" ]; then
    read -p "Bibata Original Classic is already installed. Do you want to update it? [Y/n] " answer
    if [[ "$answer" =~ ^[Yy](es)?$ ]]; then
        sudo rm -rf /usr/share/icons/Bibata-Original-Classic 
    else
        exit 1
    fi
fi

wget -O /tmp/Bibata-Original-Classic.tar.xz https://github.com/ful1e5/Bibata_Cursor/releases/latest/download/Bibata-Original-Classic.tar.xz
if [ ! -f "/tmp/Bibata-Original-Classic.tar.xz" ]; then
    echo "Error while downloading Bibata Original Classic."
    exit 1
fi

sudo mkdir -p /usr/share/icons/Bibata-Original-Classic
sudo tar -xzf /tmp/Bibata-Original-Classic.tar.xz -C /usr/share/icons/Bibata-Original-Classic --strip-components=1
rm /tmp/Bibata-Original-Classic.tar.xz

echo "Bibata Original Classic installation completed. Please check your cursor settings in .xintrc file."