#!/bin/bash

# Install docker via package manager and enable service / add user to docker group.

sudo pacman -S --noconfirm docker docker-compose

sudo systemctl enable docker.service
sudo systemctl start docker.service

sudo usermod -aG docker $USER

echo "Docker installed successfully. Please reboot your system."