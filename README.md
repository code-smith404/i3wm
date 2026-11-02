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

i3, polybar, picom, rofi, dunst, feh, st, JetBrainsMono Nerd Font, Papirus icons.

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

playerctl, brightnessctl, cava, ncmpcpp, mpd, st, polybar, picom, rofi, dunst, feh, JetBrainsMono Nerd Font, Papirus icons.

## Floating widgets

- Cava: `st --title cava -e cava`
- Music: `st --title ncmpcpp -e ncmpcpp`

## Performance notes

- Check picom load: `top`/`htop` (picom CPU) and `glxinfo`/`intel_gpu_top`.
- If lag: lower blur strength (3→2), disable shadows, turn off vsync, or switch backend to xrender (fallback config).
- Keep gaps small and disable animations.

## Troubleshooting

- Tearing: enable vsync in picom; use glx backend.
- Picom crash: run `picom --config ~/.config/picom/picom.conf -b --log-level debug`.
- Blur not showing: ensure backend glx and blur-method dual_kawase supported.
- Polybar flicker: restart polybar; check `wm-restack = i3`.
