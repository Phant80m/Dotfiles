#!/bin/bash

# Set up the source and destination directories
SRC="https://github.com/Phant80m/Dotfiles.git"
DEST="$HOME/.config"

# Clone the repository
git clone "$SRC" tmp_dotfiles
clear
# Copy the specified directories and files to the destination directory
copy_files() {
    cp -r "$1" "$2"
    echo -n "Copying $3...[          ]"
    echo -ne "\rCopying $3...[###       ]"
    sleep 0.5
    echo -ne "\rCopying $3...[######    ]"
    sleep 0.5
    echo -ne "\rCopying $3...[######### ]"
    sleep 0.5
    echo -e "\rCopying $3...[Done]"
}

copy_files "tmp_dotfiles/.config/hypr" "$DEST/" "hypr"
copy_files "tmp_dotfiles/.config/waybar" "$DEST/" "waybar"
copy_files "tmp_dotfiles/.config/rofi" "$DEST/" "rofi"
copy_files "tmp_dotfiles/.config/dunst" "$DEST/" "dunst"
copy_files "tmp_dotfiles/.config/zellij" "$DEST/" "zellij"
copy_files "tmp_dotfiles/.config/kitty" "$DEST/" "kitty"
copy_files "tmp_dotfiles/.config/fish/" "$DEST/" "fish"
copy_files "tmp_dotfiles/.config/starship.toml" "$DEST/" "starship.toml"

# Clean up temporary directory
rm -rf tmp_dotfiles

