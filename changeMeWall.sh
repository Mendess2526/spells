#!/bin/bash

if [[ $DESKTOP_SESSION == "i3" ]]
then
    i=0
    while [ "$i" -lt "$(xrandr --query | grep ' connected' | wc -l)" ]; do
        nitrogen --set-tiled --random --head="$i" ~/Pictures/Wallpapers
        i=$(($i + 1))
    done
else
    image=$(ls -1 /home/mendess/Pictures/Wallpapers/ | shuf -n1)

    if gsettings set org.gnome.desktop.background picture-uri file:///home/mendess/Pictures/Wallpapers/$image 2> ~/wallerror.log
    then
        echo -e "\033[32m"$image"\033[0m"
    else
        echo "Error: $image" 2> ~/wallerror.log
    fi
fi
