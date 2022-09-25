#!/usr/bin/env sh

# This script must be run as a normal user as it needs to read the XDG_CONFIG_HOME variable.
# The user will be asked for their password after saving the variable to a file in /tmp.

if [ $USER != root ]
then
    echo This script must be run as root, you will be prompted for your password
    echo ${XDG_CONFIG_HOME:-~/.config} | sudo tee /tmp/user.txt
    sudo chmod 755 $0
    sudo ./$0
    sudo rm /tmp/user.txt
    exit 0
fi

continue=unset

for file in "/usr/share/pulseaudio/alsa-mixer/profile-sets/apple-t2.conf" \
            "/usr/share/alsa-card-profile/mixer/profile-sets/apple-t2.conf" \
            "/usr/lib/udev/rules.d/91-pulseaudio-custom.rules" \
            "/usr/share/alsa/cards/AppleT2.conf"
do
    if [ -f "$file" ]
    then
        if [ "$continue" = "unset" ]
        then
            read -p "Old configuration files are present, do you want to delete them? (y/n) " continue

            if [ "$continue" != "y" ]
            then
                break
            fi
        fi

        rm -v $file
    fi
done

config_home=$(cat /tmp/user.txt)

for file in "$config_home/pulse/default.pa" \
            "$config_home/pulse/daemon.conf"
do
    if [ -f "$file" ]
    then
        echo "You seem to have pulseaudio configuration files present, don't forget to update them if they contain anything specific to T2 Macs"
        break
    fi
done

for dir in "/usr/share/alsa-card-profile/mixer" "/usr/share/pulseaudio/alsa-mixer"
do
    if [ -d "$dir" ]
    then
        cp -rv files/profile-sets $dir
        cp -rv files/paths $dir
    fi
done

cp -v files/91-audio-custom.rules /usr/lib/udev/rules.d/
