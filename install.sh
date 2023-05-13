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
copy_files "tmp_dotfiles/.config/ironbar" "$DEST/" "ironbar"
# Check whether yay or paru is installed
if which yay &>/dev/null; then
    AUR_INSTALLER="yay -S --noconfirm"
elif which paru &>/dev/null; then
    AUR_INSTALLER="paru -S --noconfirm"
else
    echo "No aur helper detected"
    echo "Installing paru aur helper."
    sudo pacman -Sy --needed base-devel
    git clone https://aur.archlinux.org/paru-bin.git paru-bin
    cd paru-bin,
    makepkg -si
    rm -rf paru-bin
    exit 1
fi

# Prompt user to install AUR packages
read -p "Do you want to install AUR dependencies? [y/n]: " INSTALL_AUR

if [[ "$INSTALL_AUR" == "y" ]]; then
    # Install AUR packages
    echo "Installing AUR packages..."
    $AUR_INSTALLER fish hyprland-git dunst waybar-hyprland kitty starship zellij ttf-jetbrains-mono-nerd pokemon-colorscripts-git || echo -e "\033[0;31mPlease install rofi-lbon-wayland manually\033[0m"
fi

# Clean up temporary directory
rm -rf tmp_dotfiles
echo -e "\033[0;31m Thank you for installing Phan80m's dotfiles :)\n to use the vertical bar: cargo install ironbar \033[0m"

