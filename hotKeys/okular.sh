

#!/bin/bash
APP_CLASS="okular.okular"
CMD="okular"

if wmctrl -lx | grep -i "$APP_CLASS" > /dev/null; then
    wmctrl -xa "$APP_CLASS"
else
    nohup $CMD > /dev/null 2>&1 &
fi
