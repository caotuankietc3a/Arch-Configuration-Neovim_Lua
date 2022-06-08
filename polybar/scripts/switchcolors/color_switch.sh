#!/bin/bash

SDIR="$HOME/.config/polybar/scripts/switchcolors"

MENU="$(rofi -sep "|" -dmenu -i -p 'Select Colors' -theme ~/.config/polybar/themes/tokyo_night_switch_theme.rasi <<< "嗀 tokyonight| tokyodark| dracula")"

case "$MENU" in
  *tokyonight) $SDIR/tokyonight/tokyonight.sh tokyonight ;;
  *tokyodark) $SDIR/tokyodark/tokyodark.sh tokyodark ;;
  *dracula) $SDIR/dracula/dracula.sh dracula ;;
esac
