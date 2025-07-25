#!/bin/bash

# Set laptop display as primary, and optionally configure external if desired
if xrandr | grep "HDMI-1 connected"; then
  # External connected, but we keep laptop as primary
  xrandr --output eDP-1 --primary --auto --output HDMI-1 --auto --right-of eDP-1
else
  # Only laptop screen
  xrandr --output eDP-1 --primary --auto --output HDMI-1 --off
fi
