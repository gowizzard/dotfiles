#!/bin/bash

# Install latest version of jetbrains mono font.

if [ -d "/usr/share/fonts/truetype/jetbrains-mono" ]; then
    read -p "JetBrains Mono is already installed. Do you want to update it? [Y/n] " answer
    if [[ "$answer" =~ ^[Yy](es)?$ ]]; then
        sudo rm -rf /usr/share/fonts/truetype/jetbrains-mono
    else
        exit 1
    fi
fi

VERSION=$(curl -s 'https://api.github.com/repos/JetBrains/JetBrainsMono/releases/latest' | jq -r '.tag_name')
wget -O /tmp/jetbrains-mono.zip https://github.com/JetBrains/JetBrainsMono/releases/download/$VERSION/JetBrainsMono-$(echo $VERSION | sed 's/v//').zip
if [ ! -f "/tmp/jetbrains-mono.zip" ]; then
    echo "Error while downloading JetBrains Mono."
    exit 1
fi

unzip /tmp/jetbrains-mono.zip -d /tmp/jetbrains-mono
sudo mkdir -p /usr/share/fonts/truetype/jetbrains-mono
sudo cp /tmp/jetbrains-mono/fonts/ttf/* /usr/share/fonts/truetype/jetbrains-mono
rm -rf /tmp/jetbrains-mono.zip /tmp/jetbrains-mono

echo "JetBrains Mono installation completed." 