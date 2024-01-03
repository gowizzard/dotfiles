#!/bin/bash

# Install the given version of golang for x64 systems.
if [ $# -eq 0 ]; then
    echo "no version specified"
    exit 1
elif [ $# -gt 1 ]; then
    echo "too many arguments were handed over"
    exit 1
fi

wget -O /tmp/go$1.linux-amd64.tar.gz https://go.dev/dl/go$1.linux-amd64.tar.gz
if [ ! -f "/tmp/go$1.linux-amd64.tar.gz" ]; then
    echo "Error while downloading Go."
    exit 1
fi

rm -rf /usr/local/go

tar -C /usr/local -xzf /go$1.linux-amd64.tar.gz
rm /tmp/go$1.linux-amd64.tar.gz

echo "Go $1 has been installed, please add the path to your .zshrc file."