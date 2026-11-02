# i3wm — Beautiful Setup

A curated, modern i3wm desktop configuration with Polybar, Picom, Rofi, and Dunst.

## Structure

```
.config/
├── i3/config
├── polybar/config.ini
├── picom/picom.conf
├── rofi/config.rasi
└── dunst/dunstrc
.Xresources
```

## Install

```bash
cp -r .config ~/.config
cp .Xresources ~/
```

## Keybindings

- `Mod+Return` — terminal
- `Mod+d` — app launcher
- `Mod+Shift+q` — kill
- `Mod+1..0` — workspaces
- `Mod+Shift+e` — exit

## New packages

playerctl, brightnessctl, cava, ncmpcpp, mpd, alacritty, polybar, picom, rofi, dunst, feh, JetBrainsMono Nerd Font, Papirus icons.

## Floating widgets

- Cava: `alacritty --title cava -e cava`
- Music: `alacritty --title ncmpcpp -e ncmpcpp`
