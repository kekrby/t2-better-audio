#!/usr/bin/env sh

if [ $USER != root ]
then
    echo This script must be run as root, you will be prompted for your password
    sudo chmod 755 $0
    sudo $0
    exit 0
fi

for dir in "/usr/share/alsa-card-profile/mixer/profile-sets/" "/usr/share/pulseaudio/alsa-mixer/profile-sets/"
do
    if [ -d "$dir" ]
    then
        cp -v files/profile-sets/* $dir
    fi
done

cp -v files/alsa-card-configs/* /usr/share/alsa/cards/
cp -v files/91-pulseaudio-custom.rules /usr/lib/udev/rules.d/
