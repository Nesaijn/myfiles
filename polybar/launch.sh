#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Set some Variables
OUTPUTS=$(polybar --list-monitors | cut -d":" -f1)
TRAY_OUTPUT=$(polybar --list-monitors | awk -F: '/primary/{print $1}')

[ -z $TRAY_OUTPUT ] && [ $(echo $OUTPUTS | wc -l) -eq 1 ] && TRAY_OUTPUT=$OUTPUTS

# Launch Polybar, using default config location ~/.config/polybar/config

for m in $(polybar --list-monitors | cut -d":" -f1); do
    if [[ $m == $TRAY_OUTPUT ]]
    then
      MONITOR=$m TRAY_POSITION=right polybar --reload main &
    else
      MONITOR=$m TRAY_POSITION=none polybar --reload main &
    fi

done

echo "Polybar launched..."
