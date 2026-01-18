#!/bin/bash
APP_CLASS="mate-terminal.Mate-terminal"
CMD="mate-terminal"

if wmctrl -lx | grep -i "$APP_CLASS" > /dev/null; then
    wmctrl -xa "$APP_CLASS"
else
    nohup $CMD > /dev/null 2>&1 &
fi

