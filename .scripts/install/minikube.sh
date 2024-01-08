#!/bin/bash

# Install minikube latest version for linux x64 systems.

if [ -x "$(command -v minikube)" ]; then
    read -p "minikube is already installed. Do you want to update it? [Y/n] " answer
    if [[ "$answer" =~ ^[Yy](es)?$ ]]; then
        sudo rm -rf /usr/local/bin/minikube
    else
        exit 1
    fi
fi

wget -O /tmp/minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
if [ ! -f "/tmp/minikube" ]; then
    echo "Error while downloading minikube."
    exit 1
fi

chmod +x /tmp/minikube
sudo cp /tmp/minikube /usr/local/bin
rm /tmp/minikube

echo "minikube installation completed."