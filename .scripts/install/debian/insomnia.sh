#!/bin/bash

# Add insomnia repository to apt and install the debian package.

if [ -x "$(command -v insomnia)" ]; then
    echo "Insomnia is already installed."
    exit 0
fi

curl -1sLf \
  "https://packages.konghq.com/public/insomnia/setup.deb.sh" \
  | sudo -E distro=ubuntu codename=focal bash

sudo apt update
sudo apt install insomnia

echo "Insomnia installation completed."