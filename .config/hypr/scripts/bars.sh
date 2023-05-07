#!/bin/bash

if pgrep -x "ironbar" > /dev/null
then
    # Ironbar is running, so we need to turn it off
    killall ironbar
    waybar &
else
    # Ironbar is not running, so we need to turn it on
    /home/zayd/.cargo/bin/ironbar &
    killall waybar
fi

