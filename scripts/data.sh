#!/bin/bash

ip=$(ip addr show enp8s0 | grep inet | head -n 1 | cut -d' ' -f6 | cut -d'/' -f1)
wifi=$(ip addr show wlo1 | grep inet | head -n 1 | cut -d' ' -f6 | cut -d'/' -f1)
tethering=$(ip addr show enp0s29u1u1 | grep inet | head -n 1 | cut -d' ' -f6 | cut -d'/' -f1)

if [ "$ip" != "" ]; then
    received=$(cat /sys/class/net/enp8s0/statistics/rx_bytes)
    sent=$(cat /sys/class/net/enp8s0/statistics/tx_bytes)
fi

if [ "$wifi" != "" ]; then
    received=$(cat /sys/class/net/wlo1/statistics/rx_bytes)
    sent=$(cat /sys/class/net/wlo1/statistics/tx_bytes)
fi

if [ "$tethering" != "" ]; then
    received=$(cat /sys/class/net/enp0s29u1u1/statistics/rx_bytes)
    sent=$(cat /sys/class/net/enp0s29u1u1/statistics/tx_bytes)
fi

echo "scale=2; ($received + $sent) / 1024 / 1024" | bc
