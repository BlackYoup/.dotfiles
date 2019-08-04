#!/usr/bin/env

format-patch(){
  local commitnbr=$1
  local name=$2
  local currentdir=${PWD##*/}
  local autopatchpath=/etc/paludis/autopatch/repositories/${currentdir}

  if [[ ! -d "${autopatchpath}" ]]; then
    mkdir "${autopatchpath}"
  fi

  if [[ $name = "" ]]; then
    name=$(git branch | grep "\*" | cut -d' ' -f2)
  fi

  local destfile=${autopatchpath}/${name}.patch

  git format-patch -M -C --find-copies-harder --stdout HEAD~${commitnbr} > ${destfile}
}
