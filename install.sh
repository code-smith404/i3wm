#!/usr/bin/env bash
set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="${HOME}/.config"
BACKUP_DIR="${HOME}/.config/i3wm-backup-$(date +%s)"

echo "==> Installing i3wm beautiful setup"

# Backup existing configs
if [ -d "${CONFIG_DIR}/i3" ] || [ -d "${CONFIG_DIR}/polybar" ]; then
    echo "==> Backing up existing configs to ${BACKUP_DIR}"
    mkdir -p "${BACKUP_DIR}"
    [ -d "${CONFIG_DIR}/i3" ] && cp -r "${CONFIG_DIR}/i3" "${BACKUP_DIR}/"
    [ -d "${CONFIG_DIR}/polybar" ] && cp -r "${CONFIG_DIR}/polybar" "${BACKUP_DIR}/"
    [ -d "${CONFIG_DIR}/picom" ] && cp -r "${CONFIG_DIR}/picom" "${BACKUP_DIR}/"
    [ -d "${CONFIG_DIR}/rofi" ] && cp -r "${CONFIG_DIR}/rofi" "${BACKUP_DIR}/"
    [ -d "${CONFIG_DIR}/dunst" ] && cp -r "${CONFIG_DIR}/dunst" "${BACKUP_DIR}/"
fi

# Copy configs
mkdir -p "${CONFIG_DIR}"
cp -r "${SRC}/.config/"* "${CONFIG_DIR}/"
cp "${SRC}/.Xresources" "${HOME}/.Xresources"

# Ensure wallpaper dir
mkdir -p "${HOME}/Pictures"
if [ ! -f "${HOME}/Pictures/wallpaper.jpg" ]; then
    echo "==> Place your wallpaper at ~/Pictures/wallpaper.jpg"
fi

echo "==> Done. Reload i3 with Mod+Shift+r"
echo "==> Dependencies: i3, polybar, picom, rofi, dunst, feh, alacritty, JetBrainsMono Nerd Font"
