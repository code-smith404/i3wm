#!/usr/bin/env bash
set -euo pipefail
if pgrep -x picom >/dev/null 2>&1; then
    pkill -x picom
    notify-send "Picom" "Disabled" 2>/dev/null || true
else
    picom --config "${HOME}/.config/picom/picom.conf" -b
    notify-send "Picom" "Enabled" 2>/dev/null || true
fi
EOF
mkdir -p /workspace/app/.config/i3/scripts
cat > /workspace/app/.config/i3/scripts/picom-toggle.sh <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
if pgrep -x picom >/dev/null 2>&1; then
    pkill -x picom
    notify-send "Picom" "Disabled" 2>/dev/null || true
else
    picom --config "${HOME}/.config/picom/picom.conf" -b
    notify-send "Picom" "Enabled" 2>/dev/null || true
fi
EOF
chmod +x /workspace/app/.config/i3/scripts/picom-toggle.sh