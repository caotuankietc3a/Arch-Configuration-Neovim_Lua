#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar top-left -r -c ~/.config/polybar/config.ini &
polybar top-center -r -c ~/.config/polybar/config.ini &
polybar top-right -r -c ~/.config/polybar/config.ini &
polybar top-caparies -r -c ~/.config/polybar/config.ini &
polybar top-tray -r -c ~/.config/polybar/config.ini &
