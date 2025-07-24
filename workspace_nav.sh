#!/bin/bash
direction=$1
current=$(i3-msg -t get_workspaces | jq '.[] | select(.focused).num')
all_workspaces=($(i3-msg -t get_workspaces | jq -r '.[].num' | sort -n))

if [[ "$direction" == "left" ]]; then
  target=$(echo "${all_workspaces[@]}" | tr ' ' '\n' | awk -v curr="$current" '$1 < curr {print $1}' | tail -1)
elif [[ "$direction" == "right" ]]; then
  target=$(echo "${all_workspaces[@]}" | tr ' ' '\n' | awk -v curr="$current" '$1 > curr {print $1}' | head -1)
fi

[[ -n "$target" ]] && i3-msg workspace number "$target"

