# i3wm — Beautiful Setup

A curated, modern i3wm desktop configuration.

**Theme:** Catppuccin Mocha · rounded corners · blur · gaps

## Includes

- `i3` window manager config
- `polybar` status bar
- `picom` compositor (blur, shadows, rounded corners)
- `rofi` app launcher
- `dunst` notifications
- `.Xresources` color scheme

## Install (no clone needed)

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/code-smith404/i3wm/main/install.sh)"
```

## Install (clone)

```bash
git clone https://github.com/code-smith404/i3wm.git
cd i3wm
./install.sh
```

## Dependencies

i3, polybar, picom, rofi, dunst, feh, alacritty, JetBrainsMono Nerd Font, Papirus icons.

## Keybindings (by category)

**General**
- `Mod+Return` — terminal (Alacritty)
- `Mod+d` — app launcher (Rofi)
- `Mod+Shift+q` — kill window
- `Mod+Shift+c` — reload config
- `Mod+Shift+r` — restart i3
- `Mod+Shift+e` — exit i3

**Focus / Move**
- `Mod+j/k/l/;` + arrows — focus
- `Mod+Shift+j/k/l/;` + arrows — move window

**Layout**
- `Mod+h` — split horizontal
- `Mod+v` — split vertical
- `Mod+f` — fullscreen
- `Mod+s` — stacking
- `Mod+w` — tabbed
- `Mod+e` — toggle split
- `Mod+Shift+space` — toggle floating
- `Mod+space` — focus mode toggle
- `Mod+a` — focus parent
- `Mod+r` — resize mode

**Workspaces**
- `Mod+1..0` — switch workspace
- `Mod+Shift+1..0` — move window to workspace

**Screenshots**
- `Print` — area screenshot to clipboard (flameshot)
- `Mod+Print` — full screenshot to clipboard (flameshot)

**Resize mode**
- `j/k/l/;` or arrows — resize
- `Enter/Esc` — exit mode

![Preview](preview.svg)

See [preview.md](preview.md) for details.

## Polybar themes (optional)

To use [Murzchnvok/polybar-collection](https://github.com/Murzchnvok/polybar-collection):

```bash
git clone --depth=1 https://github.com/Murzchnvok/polybar-collection ~/polybar-collection
echo 'POLYBAR_COLLECTION=$HOME/polybar-collection' | sudo tee -a /etc/environment
```

Then set `include-file`/`include-directory` in polybar config to desired theme and colorscheme.

playerctl, brightnessctl, cava, ncmpcpp, mpd, alacritty, polybar, picom, rofi, dunst, feh, JetBrainsMono Nerd Font, Papirus icons.

## Floating widgets

- Cava: `alacritty --title cava -e cava`
- Music: `alacritty --title ncmpcpp -e ncmpcpp`
