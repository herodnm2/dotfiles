#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "[*] Installing dotfiles..."

mkdir -p ~/.config
mkdir -p ~/.local/share/themes
mkdir -p ~/.local/share/icons

echo "[*] Copying .config..."
cp -r "$DOTFILES_DIR/.config/"* ~/.config/

if [ -d "$DOTFILES_DIR/.local/share/themes" ]; then
    echo "[*] Installing themes..."
    cp -r "$DOTFILES_DIR/.local/share/themes/"* ~/.local/share/themes/
fi

if [ -d "$DOTFILES_DIR/.local/share/icons" ]; then
    echo "[*] Installing icons..."
    cp -r "$DOTFILES_DIR/.local/share/icons/"* ~/.local/share/icons/
fi

if [ -f "$DOTFILES_DIR/wallpaper.sh" ]; then
    echo "[*] Applying wallpaper..."
    chmod +x "$DOTFILES_DIR/wallpaper.sh"
    "$DOTFILES_DIR/wallpaper.sh"
fi

echo "[✓] Done."
