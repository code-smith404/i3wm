#!/usr/bin/env bash
# Netspeed module: KB/s for the default route interface, graceful fallback.
set -uo pipefail

iface="$(ip route get 1.1.1.1 2>/dev/null | awk '{for(i=1;i<=NF;i++) if($i=="dev") print $(i+1)}' | head -1 || true)"
if [ -z "$iface" ]; then
    echo " Net N/A"
    exit 0
fi

read_rx_tx() {
    awk -v i="$iface:" '$1==i{print $2,$10}' /proc/net/dev
}

rx1_tx1="$(read_rx_tx || true)"
rx1="${rx1_tx1%% *}"
tx1="${rx1_tx1##* }"
sleep 1
rx2_tx2="$(read_rx_tx || true)"
rx2="${rx2_tx2%% *}"
tx2="${rx2_tx2##* }"

rx1="${rx1:-0}"; tx1="${tx1:-0}"
rx2="${rx2:-0}"; tx2="${tx2:-0}"

drx=$(( (rx2 - rx1) / 1024 ))
dtx=$(( (tx2 - tx1) / 1024 ))
echo " Net \u2193${drx} KB/s \u2191${dtx} KB/s"
