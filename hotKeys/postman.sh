#!/bin/bash
APP_CLASS="postman.Postman"
CMD="postman"

if wmctrl -lx | grep -i "$APP_CLASS" > /dev/null; then
    wmctrl -xa "$APP_CLASS"
else
    nohup $CMD > /dev/null 2>&1 &
fi
