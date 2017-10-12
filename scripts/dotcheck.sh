#!/bin/bash
# checks all necessary dependencies which are needed for stable dotfiles work

declare -a arr=("feh" "sensors" "xkblayout-state" "xcompmgr" "i3bar")

for i in "${arr[@]}"; do
  if ! command -v "$i" >/dev/null 2>&1; then
    $(~/.dotfiles/scripts/dotlog.sh "$i not found")
  fi
done
