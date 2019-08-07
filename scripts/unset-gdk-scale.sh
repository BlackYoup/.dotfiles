#!/usr/bin/env bash

focused=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true) | .output')
if [[ "${focused}" == "" ]]; then
  exit 0
fi

output=$(i3-msg -t get_outputs | jq ".[] | select(.name==${focused})")

if [[ "${output}" != "" ]]; then
  width=$(echo -n "${output}" | jq '.rect | .width')
  height=$(echo -n "${output}" | jq '.rect | .height')

  if [[ "${width}" -lt 3840 ]] && [[ "${height}" -lt 2160 ]]; then
    unset GDK_SCALE
    unset QT_AUTO_SCREEN_SCALE_FACTOR
  fi
fi

"${@}"
