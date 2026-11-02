#!/usr/bin/env bash
# Get default interface
IFACE=$(ip route | grep default | awk '{print $5}' | head -n1)
[ -z "$IFACE" ] && exit 0
R1=$(cat /sys/class/net/$IFACE/statistics/rx_bytes 2>/dev/null)
T1=$(cat /sys/class/net/$IFACE/statistics/tx_bytes 2>/dev/null)
[ -z "$R1" ] || [ -z "$T1" ] && exit 0
sleep 1
R2=$(cat /sys/class/net/$IFACE/statistics/rx_bytes 2>/dev/null)
T2=$(cat /sys/class/net/$IFACE/statistics/tx_bytes 2>/dev/null)
[ -z "$R2" ] || [ -z "$T2" ] && exit 0
RB=$((R2-R1))
TB=$((T2-T1))
if [ $RB -lt 1024 ]; then
  RX="${RB} B/s"
else
  RX="$(awk -v b=$RB 'BEGIN{printf "%.0f KB/s", b/1024}')"
fi
if [ $TB -lt 1024 ]; then
  TX="${TB} B/s"
else
  TX="$(awk -v b=$TB 'BEGIN{printf "%.0f KB/s", b/1024}')"
fi
echo "󰛳 ${RX} ↓ ${TX} ↑"
