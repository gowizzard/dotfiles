#!/bin/bash

# Install minikube latest version for linux x64 systems.

wget -O /tmp/awscli.zip https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip
if [ ! -f "/tmp/awscli.zip" ]; then
    echo "Error while downloading AWS CLI."
    exit 1
fi

unzip /tmp/awscli.zip -d /tmp/aws

if [ -x "$(command -v aws)" ]; then
    read -p "AWS CLI is already installed. Do you want to update it? [Y/n] " answer
    if [[ "$answer" =~ ^[Yy](es)?$ ]]; then
        sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update
    fi
else
    sudo ./aws/install
fi

rm -rf /tmp/awscli.zip /tmp/aws

echo "AWS CLI installation completed."