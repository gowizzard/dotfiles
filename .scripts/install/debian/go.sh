#!/bin/bash

# Install the given version of golang for x64 systems.

if [ $# -eq 0 ]; then
    echo "no version specified"
    exit 1
elif [ $# -gt 1 ]; then
    echo "too many arguments were handed over"
    exit 1
fi

if [ -d "/usr/local/go" ]; then
    read -p "Go is already installed. Do you want to update it? [Y/n] " answer
    if [[ "$answer" =~ ^[Yy](es)?$ ]]; then
        sudo rm -rf /usr/local/go
    else
        exit 1
    fi
fi

wget -O /tmp/go$1.linux-amd64.tar.gz https://go.dev/dl/go$1.linux-amd64.tar.gz
if [ ! -f "/tmp/go$1.linux-amd64.tar.gz" ]; then
    echo "Error while downloading Go."
    exit 1
fi

tar -C /usr/local -xzf /go$1.linux-amd64.tar.gz
rm /tmp/go$1.linux-amd64.tar.gz

echo "Go $1 has been installed, please add the path to your .zshrc file."