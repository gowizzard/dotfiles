#!/bin/bash

if [ $# -eq 0 ]; then
    echo "no version specified"
    exit 1
elif [ $# -gt 1 ]; then
    echo "too many arguments were handed over"
    exit 1
fi

VERSION=$1

curl -L -o /tmp/lua-$VERSION.tar.gz http://www.lua.org/ftp/lua-$VERSION.tar.gz
tar zxf /tmp/lua-$VERSION.tar.gz
cd lua-$VERSION
make all test
make install
cd ..
rm -rf lua-$VERSION

exit 0