#!/bin/bash

# Set up the destination directory
DEST="$HOME/git/Dotfiles/.config"

# Copy the specified directories and file to the destination directory
for dir in hypr waybar rofi dunst zellij kitty fish; do
    echo -n "Copying $dir...[          ]"
    cp -r "$HOME/.config/$dir" "$DEST/"
    echo -ne "\rCopying $dir...[###       ]"
    sleep 0.1
    echo -ne "\rCopying $dir...[######    ]"
    sleep 0.1
    echo -e "\rCopying $dir...[Done]"
done

echo -n "Copying starship.toml...[          ]"
cp -r "$HOME/.config/starship/" "$DEST/"
echo -ne "\rCopying starship...[###       ]"
sleep 0.1
echo -ne "\rCopying starship...[######    ]"
sleep 0.1
echo -e "\rCopying starship...[Done]"

# Commit changes to git
cd "$HOME/git/Dotfiles"
git add .
git commit -m "configs updated on $(date +%d/%m/%Y)"
rm -rf ./.config/kitty/.svn/
# Push changes to remote repository
git push

