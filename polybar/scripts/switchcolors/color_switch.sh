#!/bin/bash

SDIR="$HOME/.config/polybar/scripts/switchcolors"
THEME="$HOME/.config/polybar/themes/tokyo_night_switch_theme.rasi"

MENU="$(rofi -sep "|" -dmenu -i -p 'Select Colors' -theme $THEME <<< "嗀 tokyonight| tokyodark| dracula")"

case "$MENU" in
  *tokyonight) $SDIR/colors.sh tokyo-night;;
  *tokyodark) $SDIR/colors.sh tokyo-dark ;;
  *dracula) $SDIR/colors.sh dracula ;;
esac
