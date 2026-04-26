#!/bin/bash

DIR="$HOME/Pictures/wallpapers"

CHOICE=$(for img in "$DIR"/*; do
    echo -en "$(basename "$img")\x00icon\x1f$img\n"
done | rofi -dmenu -i -show-icons -theme ~/.config/rofi/wallpaper.rasi)

if [ -n "$CHOICE" ]; then
    swww img "$DIR/$CHOICE" --transition-type grow
fi
