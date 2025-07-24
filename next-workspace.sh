#!/bin/bash

# Get the highest numbered workspace
max_workspace=$(i3-msg -t get_workspaces | jq '.[].num' | sort -n | tail -n 1)

# If no workspaces found, default to 1
if [ -z "$max_workspace" ]; then
  next_workspace=1
else
  next_workspace=$((max_workspace + 1))
fi

# Switch to the new workspace
i3-msg workspace number "$next_workspace"
