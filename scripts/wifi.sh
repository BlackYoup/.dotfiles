#!/bin/sh

ip=$(ip addr show wlo1 | grep inet | head -n 1 | cut -d' ' -f6 | cut -d'/' -f1)

if [ "$ip" != "" ]; then
  # Having an IP is cool but if we don't internet access, it's not so useful
  #ping 8.8.8.8 -c 1 -W 1 > /dev/null
  #connected=$?
  #if [ $connected -eq 0 ]; then
  #  ping="(up)"
  #else
  #  ping="(down)"
  #fi

  essid=`iwconfig wlo1 | awk -F '"' '/ESSID/ {print $2}'`
  stngth=`iwconfig wlo1 | awk -F '=' '/Quality/ {print $2}' | cut -d '/' -f 1`
  bars=`expr $stngth / 10`

  case $bars in
    0)  bar='[----------]' ;;
    1)  bar='[/---------]' ;;
    2)  bar='[//--------]' ;;
    3)  bar='[///-------]' ;;
    4)  bar='[////------]' ;;
    5)  bar='[/////-----]' ;;
    6)  bar='[//////----]' ;;
    7)  bar='[///////---]' ;;
    8)  bar='[////////--]' ;;
    9)  bar='[/////////-]' ;;
    10) bar='[//////////]' ;;
    *)  bar='[----!!----]' ;;
  esac

  echo " $essid $bar"
  echo " $essid $bar"
  exit 0
fi
