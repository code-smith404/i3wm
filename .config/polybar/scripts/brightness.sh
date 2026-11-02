#!/usr/bin/env bash
pct=$(brightnessctl -m 2>/dev/null | awk -F, '{print $4}' | tr -d '%')
echo " ${pct:-0}%"
