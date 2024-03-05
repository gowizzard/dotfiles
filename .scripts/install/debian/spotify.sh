#!/bin/bash

# Add ansible repository to apt and install the debian package.

if [ -x "$(command -v spotify)" ]; then
    echo "Spotify is already installed."
    exit 0
fi

curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | \
    sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg

echo "deb http://repository.spotify.com stable non-free" | \
    sudo tee /etc/apt/sources.list.d/spotify.list

sudo apt update
sudo apt install -y spotify-client

if [ ! -f "~/.local/share/applications/spotify.desktop" ]; then
    cp resources/desktop/spotify.desktop ~/.local/share/applications/
fi

echo "Spotify installation completed."