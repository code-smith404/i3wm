#!/usr/bin/env bash
# Media module: shows current playerctl track, graceful fallback.
set -uo pipefail

if ! command -v playerctl >/dev/null 2>&1; then
    echo " No media"
    exit 0
fi

status="$(playerctl status 2>/dev/null || true)"
if [ "$status" = "Playing" ] || [ "$status" = "Paused" ]; then
    title="$(playerctl metadata title 2>/dev/null || true)"
    artist="$(playerctl metadata artist 2>/dev/null || true)"
    echo " ${title:-?} - ${artist:-?}"
else
    echo " No media"
fi
