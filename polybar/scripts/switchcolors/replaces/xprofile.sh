#!/bin/bash
XPROFILEDIR=$HOME/.config/X11

# replacing xprofile
function xprofile_changes() {
  if [ $1 == "tokyo-dark" ]
  then
    # sed -i "s/Pictures.*/Pictures\/Wallpapers-Gruvbox\/*/g" ~/.config/X11/.xprofile
  elif [ $1 == "dracula" ]
  then
    # sed -i "s/Pictures.*/Pictures\/Wallpapers-Dracula\/*/g" ~/.config/X11/.xprofile
  elif [ $1 == "tokyo-night" ]
  then
    # sed -i "s/Pictures.*/Pictures\/Wallpapers-TokyoNight\/*/g" ~/.config/X11/.xprofile
  fi
}
