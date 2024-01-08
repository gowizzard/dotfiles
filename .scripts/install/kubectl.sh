#!/bin/bash

# Install kubectl latest version for linux x64 systems.

if [ -x "$(command -v kubectl)" ]; then
    read -p "kubectl is already installed. Do you want to update it? [Y/n] " answer
    if [[ "$answer" =~ ^[Yy](es)?$ ]]; then
        sudo rm -rf /usr/local/bin/minikube
    else
        exit 1
    fi
fi

wget -O /tmp/kubectl "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
if [ ! -f "/tmp/kubectl" ]; then
    echo "Error while downloading kubectl."
    exit 1
fi

wget -O /tmp/kubectl.sha256 "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
if [ ! -f "/tmp/kubectl.sha256" ]; then
    echo "Error while downloading kubectl."
    exit 1
fi

echo "$(cat /tmp/kubectl.sha256)  /tmp/kubectl" | sha256sum --check

chmod +x /tmp/kubectl
sudo cp /tmp/kubectl /usr/local/bin
rm /tmp/kubectl /tmp/kubectl.sha256

echo "kubectl installation completed."