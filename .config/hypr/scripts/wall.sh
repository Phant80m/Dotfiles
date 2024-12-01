#!/bin/bash

# Set directory to wallpaper folder
dir="$HOME/.config/hypr/wallpaper"

# Create array of images in directory
images=( $(ls "$dir") )

# Create an associative array to map displayed names to full filenames
declare -A image_map

# Create an array of image names without extensions for display
display_images=()
for img in "${images[@]}"; do
  display_name="${img%.*}"
  display_images+=( "$display_name" )
  image_map["$display_name"]="$img"
done

# Use Rofi to display image selection menu
selected=$(printf '%s\n' "${display_images[@]}" | rofi -dmenu -p "Select wallpaper image")

# If user selects an image, run command with selected image as argument
if [[ -n $selected ]]; then
  full_filename="${image_map[$selected]}"
  swww img "$dir/$full_filename" --transition-step 60 --transition-type random --transition-fps 60
fi
