# Plan: Hyprland-like i3 (low-end X11)

## Decisions
- Terminal: st (foot is Wayland-only; cannot run on X11/i3).
- Modifiers: keep Alt (Mod1) for apps/focus/workspaces, Super (Mod4) for system actions.
- Picom: glx + vsync, dual_kawase blur strength 3, small shadows, corner radius 9, animations off by default (stock picom).
- Fallback picom config without blur/shadows; toggle script via Super+Shift+P.

## Scope
1. i3: terminal st, floating rules st, gaps inner 8 outer 4, thin borders, no titlebars, client colors from Catppuccin Mocha, add gap-adjust mode.
2. picom: main config as above; fallback config picom-noblur.conf.
3. polybar: colors Catppuccin, Feather + JetBrainsMono, keep modules.
4. rofi: Catppuccin Mocha theme, rounded, icon support.
5. dunst: Catppuccin Mocha, rounded.
6. st: colors.toml matching Catppuccin Mocha, font JetBrainsMono Nerd Font.
7. Xresources: Catppuccin colors.
8. install.sh: deps for Arch/Debian, backup, auto-restart, Feather font install.
9. backup.sh/rollback.sh: cover new files.
10. preview.svg/md updated.
11. README: deps, performance notes, troubleshooting, credits.

## Validation
- bash -n scripts
- i3 -C if available
- syntax checks for TOML/INI/rasi

## Open questions
- Monitor names for polybar (user must set).
- Wallpaper path (user drops image in ~/Pictures/Wallpapers).