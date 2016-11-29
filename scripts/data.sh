#!/bin/bash

ip=$(ip addr show enp8s0 2> /dev/null | grep inet | head -n 1 | cut -d' ' -f6 | cut -d'/' -f1)
wifi=$(ip addr show wlo1 2> /dev/null | grep inet | head -n 1 | cut -d' ' -f6 | cut -d'/' -f1)
tethering_interface=$(ip a | grep enp0s20 | cut -d':' -f2 | head -n1 | tr -d ' ')
tethering=$(ip addr show ${tethering_interface} 2> /dev/null | grep inet | head -n 1 | cut -d' ' -f6 | cut -d'/' -f1)

if [ "$ip" != "" ]; then
    received=$(cat /sys/class/net/enp8s0/statistics/rx_bytes)
    sent=$(cat /sys/class/net/enp8s0/statistics/tx_bytes)
elif [ "$wifi" != "" ]; then
    received=$(cat /sys/class/net/wlo1/statistics/rx_bytes)
    sent=$(cat /sys/class/net/wlo1/statistics/tx_bytes)
elif [ "$tethering_interface" != "" && "$tethering" != "" ]; then
    received=$(cat /sys/class/net/${tethering_interface}/statistics/rx_bytes)
    sent=$(cat /sys/class/net/${tethering_interface}/statistics/tx_bytes)
fi

data=$(echo "scale=2; ($received + $sent) / 1024 / 1024" | bc)

echo "$data MB"
echo "$data MB"
exit 0
