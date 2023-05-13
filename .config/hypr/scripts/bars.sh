#!/bin/bash

if pgrep -x "ironbar" > /dev/null
then
    # Ironbar is running, so we need to turn it off
    killall ironbar
    # slide for horz bar
    hyprctl keyword animation  workspaces, 1, 7, bounce,
    waybar &
else
    # Ironbar is not running, so we need to turn it on
    /home/zayd/.cargo/bin/ironbar &
    # set animation to vertical scroll for vertical bar.
    hyprctl keyword animation  workspaces, 1, 7, bounce, slidevert
    killall waybar
fi

