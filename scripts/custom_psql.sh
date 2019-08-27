#!/usr/bin/env bash

custom_psql() {
  if [[ "$#" -eq 1 ]]; then
    if [[ "$1" == "--help" ]]; then
      /usr/bin/psql --help
    else
      /usr/bin/psql "$1?keepalives_idle=1&keepalives_interval=1"
    fi
  else
    local original_cmd="$@"
    local cmd="$@"

    local hostname=$(echo "$cmd" | grep -o '\-h\s?([^\s]+)' | awk '{ print $2 }')
    if [[ -z "${hostname}" ]]; then
      /usr/bin/psql $original_cmd
      return $?
    fi
    cmd=$(echo "$cmd" | sed -E "s/-h\s?${hostname}\s?//")

    local user=$(echo "$cmd" | grep -o '\-U\s?([^\s]+)' | awk '{ print $2 }')
    if [[ -z "${user}" ]]; then
      /usr/bin/psql $original_cmd
      return $?
    fi
    cmd=$(echo "$cmd" | sed -E "s/-U\s?${user}\s?//")

    local port=$(echo "$cmd" | grep -o '\-p\s?([^\s]+)' | awk '{ print $2 }')
    if [[ -z "${port}" ]]; then
      port=5432
    else
      cmd=$(echo "$cmd" | sed -E "s/-p\s?${port}\s?//")
    fi

    local database=$(echo "$cmd" | grep -o '\-d\s?([^\s]+)' | awk '{ print $2 }')
    if [[ -n "${database}" ]]; then
      cmd=$(echo "$cmd" | sed -E "s/-d\s?${database}\s?//")
    fi

    local connect_string="postgresql://${user}:@${hostname}:${port}/${database}"

    custom_psql "${connect_string}"
    return $?
  fi
}
