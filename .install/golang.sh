#!/bin/bash

if [ $# -eq 0 ]; then
    echo "no version specified"
    exit 1
elif [ $# -gt 1 ]; then
    echo "too many arguments were handed over"
    exit 1
fi

VERSION=$1
OS="linux"
ARCH="amd64"

curl -L -o /tmp/go$VERSION.$OS-$ARCH.tar.gz https://go.dev/dl/go$VERSION.$OS-$ARCH.tar.gz
rm -rf /usr/local/go
tar -C /usr/local -xzf /tmp/go$VERSION.$OS-$ARCH.tar.gz
rm /tmp/go$VERSION.$OS-$ARCH.tar.gz

exit 0