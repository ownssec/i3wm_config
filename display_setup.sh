
#!/bin/bash

INTERNAL="eDP-1"     # change this if needed
EXTERNAL="HDMI-1"     # change this if needed

if xrandr | grep -q "$EXTERNAL connected"; then
  # Extend desktop to the right
  xrandr --output "$INTERNAL" --primary --auto \
         --output "$EXTERNAL" --auto --right-of "$INTERNAL"
else
  # External not connected; only use laptop screen
  xrandr --output "$INTERNAL" --primary --auto \
         --output "$EXTERNAL" --off
fi

