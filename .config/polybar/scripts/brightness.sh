#!/usr/bin/env bash
MAX=$(brightnessctl max 2>/dev/null)
CUR=$(brightnessctl get 2>/dev/null)
[ -z "$MAX" ] || [ -z "$CUR" ] && echo "" && exit 0
PCT=$(( CUR * 100 / MAX ))
echo "󰃞 ${PCT}%"
