#!/bin/bash

# Install the given version of python for x64 systems.
if [ $# -eq 0 ]; then
    echo "no version specified"
    exit 1
elif [ $# -gt 1 ]; then
    echo "too many arguments were handed over"
    exit 1
fi

sudo apt update
sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev \
    libnss3-dev libssl-dev libreadline-dev libffi-dev curl

wget -O /tmp/python-$1.tar.xz https://www.python.org/ftp/python/$1/Python-$1.tar.xz
if [ ! -f "/tmp/python.tar.xz" ]; then
    echo "Error while downloading Python $1."
    exit 1
fi

tar -xf /tmp/python-$1.tar.gz -C /tmp
cd /tmp/Python-$1

./configure --enable-optimizations

sudo make install

rm -rf /tmp/Python-$1
rm /tmp/python.tar.gz

python$1 --version

echo "Python $1 has been installed"