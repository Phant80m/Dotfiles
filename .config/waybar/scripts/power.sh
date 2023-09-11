#!/usr/bin/env bash

entries="  Logout\n⏾ Suspend\n󰑓 Reboot\n Shutdown"

selected=$(echo -e $entries|rofi -dmenu --cache-file /dev/null | awk '{print tolower($2)}')

case $selected in
    logout)
        hyprctl dispatch exit 0;;
    suspend)
        exec systemctl suspend;;
    reboot)
        exec systemctl reboot;;
    shutdown)
        exec systemctl poweroff -i;;
esac
