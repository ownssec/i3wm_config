#!/bin/bash

MONITOR="HDMI-A-0"
RES="1920x1080"

# If 74.99Hz is available, use it. Otherwise fall back to 60Hz.
if xrandr | grep -A1 "^$MONITOR connected" | grep -q "${RES}.*74.99"; then
    xrandr --output "$MONITOR" --mode "$RES" --rate 74.99
else
    xrandr --output "$MONITOR" --mode "$RES" --rate 60
fi

