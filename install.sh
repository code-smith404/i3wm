#!/usr/bin/env bash
set -euo pipefail

REPO="code-smith404/i3wm"
BRANCH="main"
TMPDIR="$(mktemp -d)"
trap 'rm -rf "$TMPDIR"' EXIT

# If not run from a cloned repo, fetch it
if [ ! -f "$(dirname "${BASH_SOURCE[0]}")/.config/i3/config" ]; then
    echo "==> Downloading $REPO..."
    curl -fsSL "https://github.com/$REPO/archive/refs/heads/$BRANCH.tar.gz" | tar -xz -C "$TMPDIR"
    SRC="$TMPDIR/i3wm-$BRANCH"
else
    SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
fi
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
