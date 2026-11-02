#!/usr/bin/env bash
set -euo pipefail
mode="${1:-area}"
dir="$HOME/Pictures/screenshots"
mkdir -p "$dir"
file="$dir/$(date +%Y%m%d-%H%M%S).png"

if ! command -v maim >/dev/null 2>&1 || ! command -v xclip >/dev/null 2>&1; then
    notify-send "Screenshot" "Missing maim or xclip" 2>/dev/null || true
    exit 1
fi

case "$mode" in
  area) maim -s "$file" ;;
  full) maim "$file" ;;
  window)
    if command -v xdotool >/dev/null 2>&1; then
      maim -i "$(xdotool getactivewindow)" "$file"
    else
      maim "$file"
    fi
    ;;
  *) echo "usage: $0 {area|full|window}"; exit 1 ;;
esac

xclip -selection clipboard -t image/png < "$file"
notify-send "Screenshot" "Copied to clipboard: $file" 2>/dev/null || true
