#!/usr/bin/env sh

cp files/alsa-card-configs/* /usr/share/alsa/cards/
cp files/profile-sets/* /usr/share/alsa-card-profile/mixer/profile-sets/
cp files/91-pulseaudio-custom.rules /usr/lib/udev/rules.d/
