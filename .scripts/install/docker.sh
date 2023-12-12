#!/bin/bash

# Install docker via package manager and enable service / add user to docker group.

if sudo systemctl is-active --quiet docker.service; then
    echo "Docker is already installed."
    exit 1
fi

sudo pacman -S --noconfirm docker docker-compose

sudo systemctl enable docker.service
sudo systemctl start docker.service

sudo usermod -aG docker $USER

echo "Docker installed successfully. Please reboot your system."