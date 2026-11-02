#!/usr/bin/env bash
set -euo pipefail
WALL_DIR="${HOME}/Pictures/Wallpapers"
mkdir -p "$WALL_DIR"

mapfile -t files < <(find "$WALL_DIR" -maxdepth 1 -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) | sort)

if [ "${#files[@]}" -eq 0 ]; then
    notify-send "Wallpaper" "No images in $WALL_DIR" 2>/dev/null || true
    exit 1
fi

choice=$(printf '%s\n' "${files[@]}" | xargs -n1 basename | rofi -dmenu -i -p "Wallpaper" -show-icons) || exit 0
[ -z "$choice" ] && exit 0

selected="$WALL_DIR/$choice"
feh --bg-fill "$selected"
echo "$selected" > "$HOME/.config/i3/.wallpaper"
notify-send "Wallpaper" "Set: $choice" 2>/dev/null || true
EOF
mkdir -p /workspace/app/.config/i3/scripts && chmod +x /workspace/app/.config/i3/scripts/wallpaper.sh