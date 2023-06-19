#!/bin/bash 

output= grimblast save area ~/.trash/tmp.png | ascella upload ~/.trash/tmp.png | grep -o 'https://i.indium.live/[^ ]*' | cut -d ' ' -f1 | wl-copy

notify-send "Screenshot taken" "$output"

