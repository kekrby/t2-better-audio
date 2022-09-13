#!/usr/bin/env sh

if [ $USER != root ]
then
sudo chmod 755 $0
sudo $0
exit 0
fi

cp -v files/alsa-card-configs/* /usr/share/alsa/cards/
cp -v files/profile-sets/* /usr/share/alsa-card-profile/mixer/profile-sets/
cp -v files/91-pulseaudio-custom.rules /usr/lib/udev/rules.d/
