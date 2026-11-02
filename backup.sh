#!/usr/bin/env bash
# Backup current i3wm configs to a timestamped directory.
set -euo pipefail

CONFIG_DIR="${HOME}/.config"
BACKUP_DIR="${HOME}/.config/i3wm-backup-$(date +%s)"

mkdir -p "$BACKUP_DIR"
for comp in i3 polybar picom rofi dunst; do
    [ -d "${CONFIG_DIR}/${comp}" ] && cp -r "${CONFIG_DIR}/${comp}" "${BACKUP_DIR}/"
done
[ -f "${HOME}/.Xresources" ] && cp "${HOME}/.Xresources" "${BACKUP_DIR}/"

echo "Backup created at ${BACKUP_DIR}"
