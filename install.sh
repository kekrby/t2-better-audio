#!/usr/bin/env sh

if [ $USER != root ]
then
    echo This script must be run as root, you will be prompted for your password
    sudo chmod 755 $0
    sudo ./$0
    exit 0
fi

for dir in "/usr/share/alsa-card-profile/mixer" "/usr/share/pulseaudio/alsa-mixer"
do
    if [ -d "$dir" ]
    then
        cp -rv files/{profile-sets,paths} $dir
    fi
done

cp -v files/91-audio-custom.rules /usr/lib/udev/rules.d/
