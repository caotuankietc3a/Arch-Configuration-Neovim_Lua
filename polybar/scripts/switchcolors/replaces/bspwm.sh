#!/bin/bash

BSPWMDIR="$HOME/.config/bspwm"
SXHKD="$HOME/.config/sxhkd"

# replacing border in i3
function bspwm_changes() {
  if [ $1 == "tokyo-dark" ]
  then
    sed -i '0,/border_color=.*/s//border_color=\"#fa8541\"/' $BSPWMDIR/bspwmrc
    sed -i '0,/feh --bg-scale --randomize .*/s//feh --bg-scale --randomize ~\/.config\/Arch\\ Config\/Spaces\/*/' $SXHKD/sxhkdrc
    sed -i '0,/feh --bg-scale --randomize .*/s//feh --bg-scale --randomize ~\/.config\/Arch\\ Config\/Spaces\/*/' $BSPWMDIR/bspwmrc
  elif [ $1 == "dracula" ]
  then
    sed -i '0,/border_color=.*/s//border_color=\"#c678dd\"/' $BSPWMDIR/bspwmrc
    sed -i '0,/feh --bg-scale --randomize .*/s//feh --bg-scale --randomize ~\/.config\/Arch\\ Config\/Fantacy\/*/' $SXHKD/sxhkdrc
    sed -i '0,/feh --bg-scale --randomize .*/s//feh --bg-scale --randomize ~\/.config\/Arch\\ Config\/Fantacy\/*/' $BSPWMDIR/bspwmrc
  elif [ $1 == "tokyo-night" ]
  then
    sed -i '0,/border_color=.*/s//border_color=\"#61AFEF\"/' $BSPWMDIR/bspwmrc
    sed -i '0,/feh --bg-scale --randomize .*/s//feh --bg-scale --randomize ~\/.config\/Arch\\ Config\/Abstract\/*/' $SXHKD/sxhkdrc
    sed -i '0,/feh --bg-scale --randomize .*/s//feh --bg-scale --randomize ~\/.config\/Arch\\ Config\/Abstract\/*/' $BSPWMDIR/bspwmrc
  fi
}
