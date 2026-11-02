#!/usr/bin/env bash
status=$(playerctl status 2>/dev/null)
if [ "$status" = "Playing" ] || [ "$status" = "Paused" ]; then
  title=$(playerctl metadata title 2>/dev/null)
  artist=$(playerctl metadata artist 2>/dev/null)
  icon=""; [ "$status" = "Playing" ] && icon="" || icon=""
  echo "$icon  $title - $artist"
else
  echo " No media"
fi
