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

## Keybindings (mangoWM-style)

**General**
- `Super+Return` — terminal
- `Super+Space` — app launcher (Rofi)
- `Super+Q` — kill window
- `Super+M` — exit i3
- `Super+F` — fullscreen
- `Super+R` — reload config

**Focus**
- `Super+Arrows` — focus

**Workspaces**
- `Ctrl+1..9` — switch workspace
- `Super+1..9` — move window to workspace

**Move**
- `Super+Shift+Arrows` — move window
- `Super+Tab` — focus next

**Media/Brightness**
- Standard XF86 keys

**Screenshots**
- `Print` — area to clipboard
- `Super+Print` — full to clipboard

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
