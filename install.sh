#!/usr/bin/env bash
set -euo pipefail

REPO="code-smith404/i3wm"
BRANCH="main"
TMPDIR="$(mktemp -d)"
trap 'rm -rf "$TMPDIR"' EXIT

script_path="${BASH_SOURCE[0]:-}"
if [ -n "$script_path" ] && [ -f "$(dirname "$script_path")/.config/i3/config" ]; then
    SRC="$(cd "$(dirname "$script_path")" && pwd)"
else
    echo "==> Downloading $REPO..."
    curl -fsSL "https://github.com/$REPO/archive/refs/heads/$BRANCH.tar.gz" | tar -xz -C "$TMPDIR"
    SRC="$TMPDIR/i3wm-$BRANCH"
fi

CONFIG_DIR="${HOME}/.config"
BACKUP_DIR="${HOME}/.config/i3wm-backup-$(date +%s)"

echo "==> Installing i3wm beautiful setup"

if [ -d "${CONFIG_DIR}/i3" ] || [ -d "${CONFIG_DIR}/polybar" ]; then
    echo "==> Backing up existing configs to ${BACKUP_DIR}"
    mkdir -p "${BACKUP_DIR}"
    [ -d "${CONFIG_DIR}/i3" ] && cp -r "${CONFIG_DIR}/i3" "${BACKUP_DIR}/"
    [ -d "${CONFIG_DIR}/polybar" ] && cp -r "${CONFIG_DIR}/polybar" "${BACKUP_DIR}/"
    [ -d "${CONFIG_DIR}/picom" ] && cp -r "${CONFIG_DIR}/picom" "${BACKUP_DIR}/"
    [ -d "${CONFIG_DIR}/rofi" ] && cp -r "${CONFIG_DIR}/rofi" "${BACKUP_DIR}/"
    [ -d "${CONFIG_DIR}/dunst" ] && cp -r "${CONFIG_DIR}/dunst" "${BACKUP_DIR}/"
fi

mkdir -p "${CONFIG_DIR}"
cp -r "${SRC}/.config/"* "${CONFIG_DIR}/"
cp "${SRC}/.Xresources" "${HOME}/.Xresources"

mkdir -p "${HOME}/Pictures/Wallpapers"
if [ ! -f "${HOME}/Pictures/wallpaper.jpg" ]; then
    echo "==> Place your wallpaper at ~/Pictures/wallpaper.jpg or ~/Pictures/Wallpapers"
fi

if pgrep -x i3 >/dev/null 2>&1; then
    i3-msg reload >/dev/null 2>&1 || true
    pkill -x polybar 2>/dev/null || true
    polybar main >/dev/null 2>&1 &
    pkill -x picom 2>/dev/null || true
    picom --config "${HOME}/.config/picom/picom.conf" -b >/dev/null 2>&1 || true
fi

echo "==> Done."
echo "==> Dependencies: i3, polybar, picom, rofi, dunst, feh, st, JetBrainsMono Nerd Font"