#!/usr/bin/env bash
# Screenshot wrapper using maim + xclip.
# Usage: screenshot.sh {select|full|window}
# Saves to ~/Pictures/screenshots and copies to clipboard.
set -uo pipefail

SCREENSHOT_DIR="${HOME}/Pictures/screenshots"
mkdir -p "$SCREENSHOT_DIR"

mode="${1:-select}"
file="$SCREENSHOT_DIR/$(date +%Y%m%d-%H%M%S).png"

notify() {
    if command -v notify-send >/dev/null 2>&1; then
        notify-send -t 3000 "$@"
    fi
}

if ! command -v maim >/dev/null 2>&1 || ! command -v xclip >/dev/null 2>&1; then
    notify "Screenshot" "maim and/or xclip not installed" || true
    echo "maim and/or xclip not installed" >&2
    exit 1
fi

case "$mode" in
    select)
        maim -s "$file" || true
        ;;
    full)
        maim "$file" || true
        ;;
    window)
        window=""
        if command -v xdotool >/dev/null 2>&1; then
            window="$(xdotool getactivewindow 2>/dev/null || true)"
        fi
        if [ -n "$window" ]; then
            maim -i "$window" "$file" || true
        else
            maim "$file" || true
        fi
        ;;
    *)
        echo "Usage: $0 {select|full|window}" >&2
        exit 1
        ;;
esac

if [ -f "$file" ] && [ -s "$file" ]; then
    xclip -selection clipboard -t image/png -i "$file" || true
    notify "Screenshot" "Saved to $file" || true
else
    notify "Screenshot" "Cancelled" || true
fi
