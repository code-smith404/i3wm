# Ultimate i3 Daily-Use Desktop Plan

## Goal
Transform the existing i3wm repo into a polished, reliable, keyboard-driven daily desktop while preserving Catppuccin Mocha aesthetic and existing useful configs.

## Context
- Repo: /workspace/app, branch main.
- Existing: i3, polybar, picom, rofi, dunst, cava, ncmpcpp, install.sh, preview.svg.
- Target: Arch Linux, X11, i3. Do not convert to Wayland/Sway.
- Shell: fish must remain untouched.

## Constraints
- Back up configs before changes; never overwrite unrelated files.
- Ask before destructive ops.
- Idempotent scripts.
- Low resource usage; graceful handling of missing hardware (battery, Bluetooth, monitors).
- Validate configs and scripts; verify executables exist.

## Implementation Stages

### Stage 1: Inspection & Backups
- Clone repo state; record installed packages via `pacman -Qq`.
- Detect X11 via `$XDG_SESSION_TYPE` / `loginctl`.
- Backup ~/.config/i3, polybar, picom, rofi, dunst, alacritty, fish to timestamped dir.

### Stage 2: Window Management
- Keep i3; add named workspaces with Nerd Font icons (1: , 2: , etc.).
- Smart gaps/borders already; tune inner/outer.
- Scratchpad terminal binding.
- Monitor switching via xrandr scripts.
- Focus follows mouse optional (configurable).
- Floating rules for pavucontrol, nm-connection-editor, cava, ncmpcpp.

### Stage 3: Status Bar
- Polybar modules: workspaces, media, netspeed, date, cpu+temp, memory (GiB), brightness, volume, battery, bluetooth, tray.
- Functional scripts in ~/.config/polybar/scripts.
- Handle missing battery/bluetooth gracefully.

### Stage 4: Launcher
- Rofi modes: drun, run, window, filebrowser, clipboard (rofi-greenclip or clipmenu), powermenu.
- Catppuccin Mocha theme file.

### Stage 5: Terminal & Productivity
- Alacritty config with JetBrainsMono Nerd Font, padding, Catppuccin Mocha.
- Fish integration (do not overwrite fish config; append if needed).
- Terminal utils: btop, fastfetch, ripgrep, fd, fzf, bat, eza, zoxide, yazi (install via pacman).

### Stage 6: Notifications & Audio
- Dunst urgency colors/actions.
- Audio: volume up/down/mute, mic mute, output switching via pactl/wpctl, media keys.

### Stage 7: Screenshot & Clipboard
- Wrapper script using maim + xclip; fallback flameshot.
- Clipboard manager: greenclip or clipmenu; rofi history binding.
- Save to ~/Pictures/screenshots.

### Stage 8: Power Management
- Power menu (rofi) with lock/suspend/hibernate/reboot/shutdown/logout; confirm destructive.
- i3lock or betterlockscreen; xss-lock idle lock; xautolock.

### Stage 9: File Management
- Thunar/Nautilus if installed; bind Mod+Shift+f.
- Terminal file manager: yazi binding.
- Removable drive handling via udisks2 (optional).

### Stage 10: Visual Design
- Catppuccin Mocha across i3/polybar/picom/rofi/dunst/alacritty.
- Picom: blur, rounded corners, shadows, low resource.

### Stage 11: Keybindings
- Document all shortcuts in README by category.
- Avoid conflicts; use Mod4 primary.

### Stage 12: Reliability
- Validate i3 config (`i3 -C -c`), polybar (`polybar --config=... --dump=...`?), picom (`picom --config ... --diagnostics`).
- Check executables via script.
- Graceful hardware detection.

### Stage 13: Installation & Docs
- install.sh (idempotent), backup.sh, rollback.sh, dependency list.
- README: install, shortcuts, troubleshooting.

### Stage 14: Testing
- Script syntax checks.
- Config validation.
- Manual test checklist.

## Deliverables
- Updated repo configs and scripts.
- README with shortcuts/troubleshooting.
- Install/backup/rollback scripts.

## Open Questions
- Preferred file manager (thunar vs nautilus) if installed?
- Preferred lock tool (i3lock-color vs betterlockscreen)?
- Clipboard manager preference (greenclip vs clipmenu)?

## Risks
- Missing tools on target; scripts must check and notify.
- Polybar module syntax varies by version; validate.
- Fish config must not be overwritten.