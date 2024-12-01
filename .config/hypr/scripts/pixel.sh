#!/bin/bash

# Define the path to the state file
STATE_FILE="/tmp/waybar_toggle_state"

# Check if the state file exists, and if not, create it with the initial state of "off"
if [[ ! -f "$STATE_FILE" ]]; then
    echo "off" > "$STATE_FILE"
fi

# Read the current state from the state file
STATE=$(cat "$STATE_FILE")

if [[ "$STATE" == "off" ]]; then
    # Turn off rounding
    hyprctl keyword decoration:rounding 0
    # Kill and restart Waybar with the first style and wallpaper
    pkill waybar
    swww img ~/.config/hypr/wallpaper/pixel-lush-sakura.png
    waybar --style ~/.config/waybar/style_block.css
    # Update the state to "on"
    echo "on" > "$STATE_FILE"
else
    # Turn on rounding
    hyprctl keyword decoration:rounding 10
    # Kill and restart Waybar with the second style and wallpaper
    pkill waybar
    swww img ~/.config/hypr/wallpaper/lush-sakura.png
    waybar --style ~/.config/waybar/style.css
    # Update the state to "off"
    echo "off" > "$STATE_FILE"
fi

