#!/bin/bash

chosen=$(echo -e "Performance\nPowersave" | rofi -dmenu -p "Select mode")

case "$chosen" in
  "Performance")
    output=$(pkexec cpupower frequency-set -g performance 2>&1)
    ;;
  "Powersave")
    output=$(pkexec cpupower frequency-set -g powersave 2>&1)
    ;;
esac

zenity --info --title="Command Output" --text="$output"
