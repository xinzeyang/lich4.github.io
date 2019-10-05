#!/bin/sh

# 该模块用于重新构造cydia源

if [ x$1 == x ]; then
    echo Usage: $0 [debpath] 
    exit 0
fi

debpath=$1

if [ ! -f Packages ]; then
    dpkg-scanpackages $debpath > $debpath/Packages
else
    gzip -k $debpath/Packages 
    bzip2 -z -k $debpath/Packages
    xz -z -k $debpath/Packages 
fi
