#!/usr/bin/env bash
# Brightness module: uses brightnessctl, graceful fallback when no backlight.
set -uo pipefail

if ! command -v brightnessctl >/dev/null 2>&1; then
    echo " Brightness N/A"
    exit 0
fi

pct="$(brightnessctl -m 2>/dev/null | awk -F, '{print $4}' | tr -d '%' || true)"
echo " ${pct:-0}%"
