#!/usr/bin/env bash

# cat 99-screen.rules
# SUBSYSTEM=="drm", ACTION=="change", RUN+="/usr/bin/su - arnaud -c '/home/arnaud/scripts/screen-change.sh'"

export DISPLAY=:0
all_screens=$(xrandr | grep 'connected')
connected_screens=$(echo -n "${all_screens}" | grep '\sconnected' | grep -v eDP-1 | awk '{ print $1 }')
length="${#connected_screens[@]}"

echo "Connected screens2:"
echo "$connected_screens"
echo "all_screens:"
echo "$all_screens"

# Not using $length here because bash still thinks it has 1 element
if [[ "${connected_screens}" == "" ]]; then
  for screen in $(echo -n "$all_screens" | grep -v eDP-1 | awk '{ print $1 }'); do
    echo "xrandr --output $screen --off"
    xrandr --output $screen --off
  done
  /home/arnaud/.fehbg
  /usr/bin/notify-send 'Screens disconnected'
else
  if [[ "${length}" -eq 1 ]]; then
    xrandr --output "${connected_screens[0]}" --auto --above "eDP-1"
    /home/arnaud/.fehbg
    /usr/bin/i3 workspace 2 && /usr/bin/i3 move workspace to output up
    /usr/bin/notify-send 'Screen connected!'
  else
    if [[ "${length}" -gt 1 ]]; then
      /usr/bin/notify-send "Multiple screens detected. Don't arrange layout"
    fi
  fi
fi
