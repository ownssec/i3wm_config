#!/bin/bash
direction=$1
current_ws=$(i3-msg -t get_workspaces | jq '.[] | select(.focused).num')
all_ws=($(i3-msg -t get_workspaces | jq -r '.[].num' | sort -n))

if [[ "$direction" == "left" ]]; then
  target=$(printf "%s\n" "${all_ws[@]}" | awk -v curr="$current_ws" '$1 < curr {print $1}' | tail -1)
elif [[ "$direction" == "right" ]]; then
  target=$(printf "%s\n" "${all_ws[@]}" | awk -v curr="$current_ws" '$1 > curr {print $1}' | head -1)
fi

[[ -n "$target" ]] && i3-msg move container to workspace number "$target"
