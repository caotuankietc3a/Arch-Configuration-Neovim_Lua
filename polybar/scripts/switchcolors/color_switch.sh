#!/bin/bash

SDIR="$HOME/.config/polybar/scripts/switchcolors"

MENU="$(rofi -sep "|" -dmenu -i -p 'Select Colors' -theme ~/.config/polybar/themes/tokyo_night_switch_theme.rasi <<< "嗀 tokyonight| tokyodark")"

case "$MENU" in
  ## Light Colors
  *tokyonight) $SDIR/colors.sh tokyonight ;;
  *tokyodark) $SDIR/colors.sh tokyodark ;;
esac
