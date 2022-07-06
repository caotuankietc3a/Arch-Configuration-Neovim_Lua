#!/bin/bash

# replacing theme file and restart tray icons
function settings_changes() {
  killall nm-applet blueman-applet dunst
  nm-applet --indicator &
  blueman-applet &
  dunst &
  pkill dunst
  dunst &
  pkill -USR1 -x sxhkd
  bspc wm -r
}
