
#!/bin/bash

direction="$1"

# Get tree of windows
tree=$(i3-msg -t get_tree)

# Get the focused window ID
focused_id=$(echo "$tree" | jq '.. | objects | select(.focused == true).id')

# Get the parent container of the focused window
parent=$(echo "$tree" | jq '.. | objects | select(.nodes? and any(.nodes[]; .id == '$focused_id'))')

# Get the list of sibling windows
sibling_ids=$(echo "$parent" | jq '.nodes[].id')

# Find the position of the focused window
index=0
focus_index=-1
for id in $sibling_ids; do
  if [ "$id" = "$focused_id" ]; then
    focus_index=$index
  fi
  index=$((index+1))
done

# Total number of siblings
total=$(echo "$sibling_ids" | wc -l)

# Decide if movement is allowed
case "$direction" in
  left|up)
    if [ "$focus_index" -gt 0 ]; then
      i3-msg "focus $direction"
    fi
    ;;
  right|down)
    if [ "$focus_index" -lt $((total-1)) ]; then
      i3-msg "focus $direction"
    fi
    ;;
esac
i
