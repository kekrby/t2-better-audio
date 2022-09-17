#!/usr/bin/env sh

if [ $USER != root ]
then
    echo This script must be run as root, you will be prompted for your password
    sudo chmod 755 $0
    sudo ./$0
    exit 0
fi

cp -rv files/ucm2/* /usr/share/alsa/ucm2
