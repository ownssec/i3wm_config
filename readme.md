# 🪟 i3 Window Manager Configuration

This is a custom configuration for the [i3 Window Manager](https://i3wm.org/) that enhances your Linux desktop experience with:

- ✅ Rofi app launcher
- ✅ Polybar status bar
- ✅ Flameshot for screenshots
- ✅ Wallpaper via feh
- ✅ Workspace and container navigation
- ✅ Volume and mic controls
- ✅ XSS-lock and i3lock screen locking
- ✅ NetworkManager tray support
- ✅ Fully keyboard-driven layout and custom scripts

---

## 📦 Requirements & Installation

Install all the required tools using the following command (for Debian, Ubuntu, Zorin, Kali, etc.):

```bash
sudo apt update && sudo apt install -y \
  i3-wm rofi polybar flameshot feh \
  xss-lock i3lock dex jq \
  network-manager-gnome
📁 Folder Structure
Your configuration should be placed in the following structure:

perl
Copy
Edit
~/.config/i3/
├── config                  # Your main i3 configuration
├── focus_no_wrap.sh       # No-wrap window focus script
├── workspace_nav.sh       # Navigate to adjacent workspace
├── move_container.sh      # Move container to another output
├── next-workspace.sh      # Go to next numbered workspace
└── polybar/
    └── launch.sh          # Launch script for Polybar
🔧 Setup Instructions
Create directories and files:

bash
Copy
Edit
mkdir -p ~/.config/i3 ~/.config/polybar
Paste your config and scripts into their respective files:

bash
Copy
Edit
nano ~/.config/i3/config
nano ~/.config/i3/focus_no_wrap.sh
nano ~/.config/i3/workspace_nav.sh
nano ~/.config/i3/move_container.sh
nano ~/.config/i3/next-workspace.sh
nano ~/.config/polybar/launch.sh
Make all scripts executable:

bash
Copy
Edit
chmod +x ~/.config/i3/*.sh ~/.config/polybar/launch.sh
Ensure the wallpaper exists or update the path:

bash
Copy
Edit
feh --bg-scale ~/Pictures/wp2.jpg
📜 Script Contents
focus_no_wrap.sh
bash
Copy
Edit
#!/bin/bash
direction=$1
i3-msg "focus $direction"
workspace_nav.sh
bash
Copy
Edit
#!/bin/bash
direction=$1
current=$(i3-msg -t get_workspaces | jq '.[] | select(.focused).num')
all=($(i3-msg -t get_workspaces | jq -r '.[].num' | sort -n))

if [[ "$direction" == "left" ]]; then
  next=$(echo "${all[@]}" | tr ' ' '\n' | awk -v c="$current" '$1 < c' | tail -n1)
else
  next=$(echo "${all[@]}" | tr ' ' '\n' | awk -v c="$current" '$1 > c' | head -n1)
fi

[[ -n "$next" ]] && i3-msg "workspace number $next"
move_container.sh
bash
Copy
Edit
#!/bin/bash
direction=$1
i3-msg "move workspace to output $direction"
next-workspace.sh
bash
Copy
Edit
#!/bin/bash
current=$(i3-msg -t get_workspaces | jq '.[] | select(.focused).num')
next=$((current + 1))
i3-msg "workspace number $next"
polybar/launch.sh
bash
Copy
Edit
#!/bin/bash
killall -q polybar
polybar main &
⌨️ Keybindings (Summary)
Shortcut	Action
Ctrl + Space	Launch rofi application launcher
Alt + h / l	Focus left/right window (no wrap)
Ctrl + Alt + h / l	Navigate to previous/next workspace
Ctrl + Alt + ← / →	Move container to another monitor
Ctrl + Alt + n	Go to next workspace number
Ctrl + Alt + =	Launch flameshot for screenshot
Alt + Shift + q	Kill focused window
Alt + Shift + Space	Toggle floating mode
Alt + Space	Switch between tiling/floating window
Alt + r	Enter resize mode
Alt + Shift + c	Reload i3 config
Alt + Shift + r	Restart i3 session
Ctrl + Alt + Delete	Lock screen on suspend via xss-lock

📷 Screenshot Tool
This configuration uses Flameshot.

To take a screenshot:

bash
Copy
Edit
flameshot gui
Or press: Ctrl + Alt + =

📶 Network Applet
nm-applet is auto-started to show a system tray icon for managing networks.

If it doesn't appear, you can launch it manually:

bash
Copy
Edit
nm-applet &
🧊 Polybar Setup
Polybar is launched via:

bash
Copy
Edit
~/.config/polybar/launch.sh
To customize Polybar themes and modules:

👉 https://github.com/polybar/polybar/wiki

🖼 Wallpaper Setup
To set a background image:

bash
Copy
Edit
feh --bg-scale ~/Pictures/wp2.jpg
Update the image path in your i3 config if needed.

🔒 Lock on Suspend
This setup uses xss-lock and i3lock to automatically lock the screen on suspend:

bash
Copy
Edit
xss-lock --transfer-sleep-lock -- i3lock --nofork
You can also lock manually using:

bash
Copy
Edit
i3lock
💡 Optional Enhancements
Transparency & Shadows with picom
Install picom:

bash
Copy
Edit
sudo apt install picom
Start it with:

bash
Copy
Edit
picom --config ~/.config/picom/picom.conf &
Rounded Corners and Gaps
Install i3-gaps:

bash
Copy
Edit
sudo apt install i3 i3-gaps
You'll need to update your i3 config to use gaps and enable rounded corners via picom.

📚 External Resources
📖 i3 User Guide: https://i3wm.org/docs/userguide.html

📊 Polybar Wiki: https://github.com/polybar/polybar/wiki

🚀 Rofi Launcher: https://github.com/davatorium/rofi

📸 Flameshot: https://flameshot.org/

🔍 jq (JSON CLI): https://stedolan.github.io/jq/

🖼 feh (Wallpaper): https://feh.finalrewind.org/

✅ Final Tips
Reload or Restart i3:
bash
Copy
Edit
# Reload config
$mod + Shift + c

# Restart i3 session
$mod + Shift + r
Check if services are running:
bash
Copy
Edit
ps aux | grep polybar
ps aux | grep flameshot``
```

#one command setup
