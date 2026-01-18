#!/bin/bash
APP_CLASS="org.gnome.Nautilus.org.gnome.Nautilus"
CMD="nautilus"

if wmctrl -lx | grep -i "$APP_CLASS" > /dev/null; then
    wmctrl -xa "$APP_CLASS"
else
    nohup $CMD ~/Downloads  > /dev/null 2>&1 &
fi

