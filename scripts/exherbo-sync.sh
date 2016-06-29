#!/usr/bin/env bash

exherbo-sync() {
  local repo=$1
  local package=$2

  if [[ -z $repo ]]; then
    echo "Syncs local repository"
    echo "Usage: exherbo-sync repo [package-to-resolve]"
    return 1
  fi

  cave sync -s local -r $(cd /home/arnaud/Dev/exherbo/repos/$1; rev=$(git rev-parse $(git branch | grep "\*" | cut -d' ' -f2)) && echo $rev) $1

  if [[ -n $package ]]; then
    cave resolve $2 -xz1
  fi
}
