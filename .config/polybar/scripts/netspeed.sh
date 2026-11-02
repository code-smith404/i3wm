#!/usr/bin/env bash
iface=$(ip route get 1.1.1.1 2>/dev/null | awk '{for(i=1;i<=NF;i++) if($i=="dev") print $(i+1)}' | head -1)
read rx1 tx1 < <(awk -v i="$iface:" '$1==i{print $2,$10}' /proc/net/dev)
sleep 1
read rx2 tx2 < <(awk -v i="$iface:" '$1==i{print $2,$10}' /proc/net/dev)
drx=$(( (rx2-rx1)/1024 ))
dtx=$(( (tx2-tx1)/1024 ))
echo " Net ${drx} KB/s"
