#!/usr/bin/env bash
# Rollback to the most recent i3wm backup.
set -euo pipefail

CONFIG_DIR="${HOME}/.config"

BACKUP_DIR="$(ls -td "${CONFIG_DIR}"/i3wm-backup-* 2>/dev/null | head -1 || true)"
if [ -z "$BACKUP_DIR" ] || [ ! -d "$BACKUP_DIR" ]; then
    echo "No backup found to rollback to" >&2
    exit 1
fi

for comp in i3 polybar picom rofi dunst; do
    [ -d "${BACKUP_DIR}/${comp}" ] && cp -r "${BACKUP_DIR}/${comp}" "${CONFIG_DIR}/"
done
[ -f "${BACKUP_DIR}/.Xresources" ] && cp "${BACKUP_DIR}/.Xresources" "${HOME}/.Xresources"

echo "Rolled back from ${BACKUP_DIR}"
