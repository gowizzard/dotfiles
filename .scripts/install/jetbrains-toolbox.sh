#!/bin/bash

# Install JetBrains Toolbox latest version for linux x64 systems.

if [ -d "/opt/jetbrains-toolbox" ]; then
    echo "JetBrains Toolbox is already installed."
    exit 1
fi

wget -O /tmp/jetbrains-toolbox.tar.gz $(curl -s 'https://data.services.jetbrains.com/products/releases?code=TBA&latest=true&type=release' | jq -r '.TBA[0].downloads.linux.link')

if [ ! -f "/tmp/jetbrains-toolbox.tar.gz" ]; then
    echo "Error while downloading JetBrains Toolbox."
    exit 1
fi

sudo mkdir -p /opt/jetbrains-toolbox
sudo tar -xzf /tmp/jetbrains-toolbox.tar.gz -C /opt/jetbrains-toolbox --strip-components=1
rm /tmp/jetbrains-toolbox.tar.gz

if [ ! -L "/usr/local/bin/jetbrains-toolbox" ]; then
    sudo ln -s /opt/redisinsight/jetbrains-toolbox /usr/local/bin/jetbrains-toolbox
fi

if command -v pacman &> /dev/null; then
    sudo pacman -S --noconfirm fuse2 libappindicator-gtk3
elif command -v apt &> /dev/null; then
    sudo apt install -y libfuse2 libxi6 libxrender1 libxtst6 mesa-utils libfontconfig libgtk-3-bin 
else
    echo "Unsupported Linux distribution. Please install the required dependencies manually."
    exit 1
fi

echo "JetBrains Toolbox installation completed."