#!/usr/bin/env bash
exec >/tmp/lock.out 2>&1

outputs=$(i3-msg -t get_outputs)
widths=$(echo "$outputs" | jq -r '.[] | select (.active==true) | .rect | .width' | xargs | sed 's/\s//g')
heights=$(echo "$outputs" | jq -r '.[] | select (.active==true) | .rect | .height' | xargs | sed 's/\s//g')

backgroundImage="/tmp/screenlocker-${widths}x${heights}.png"

workspaces=$(echo "$outputs" | jq -r '.[] | .current_workspace' | grep -v null)

echo "$backgroundImage"

if [[ ! -f "${backgroundImage}" ]]; then
  echo "Not found, create it!"

  i3 bar mode hide &&  \
    i3 workspace 1 &&  \
    i3 workspace 0 &&  \
    i3 workspace 2 &&  \
    i3 workspace 10 && \
    scrot -q 100 "${backgroundImage}"

fi

/usr/bin/i3lock -i "${backgroundImage}" -f -p default -t; i3 bar mode dock

for nbr in $workspaces ; do i3 workspace $nbr; done
