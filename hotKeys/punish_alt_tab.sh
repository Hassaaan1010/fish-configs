#!/bin/bash
# annoying_alt_tab.sh

# Get currently focused window
focused=$(xdotool getactivewindow)
class=$(xprop -id "$focused" WM_CLASS | awk -F '"' '{print $2}')

# Count how many windows of this class are open
count=$(wmctrl -lx | grep -c "$class")

if [ "$count" -le 1 ]; then
    # play a quick annoying sound if only 1 window of that class
    timeout 0.4s paplay /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga & 
   # paplay /usr/share/sounds/freedesktop/stereo/dialog-warning.oga &
fi

# finally, actually perform alt+tab (send it manually)
xdotool key Alt+Tab
