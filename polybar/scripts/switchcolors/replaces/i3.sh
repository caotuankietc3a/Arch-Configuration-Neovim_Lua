#!/bin/bash

I3DIR="$HOME/.config/i3/config"

# replacing border in i3
function i3_changes() {
  if [ $1 == "tokyo-dark" ]
  then
    sed -i '0,/set $ac .*/s//set $ac #fa8541/' $I3DIR
    sed -i '0,/set $randompicture exec feh --bg-scale --randomize .*/s//set $randompicture exec feh --bg-scale --randomize ~\/.config\/Arch\\ Config\/Spaces\/*/' $I3DIR
  elif [ $1 == "dracula" ]
  then
    sed -i '0,/set $ac .*/s//set $ac #c678dd/' $I3DIR
    sed -i '0,/set $randompicture exec feh --bg-scale --randomize .*/s//set $randompicture exec feh --bg-scale --randomize ~\/.config\/Arch\\ Config\/Fantacy\/*/' $I3DIR
  elif [ $1 == "tokyo-night" ]
  then
    sed -i '0,/set $ac .*/s//set $ac #61AFEF/' $I3DIR
    sed -i '0,/set $randompicture exec feh --bg-scale --randomize .*/s//set $randompicture exec feh --bg-scale --randomize ~\/.config\/Arch\\ Config\/Anime\/*/' $I3DIR
  fi
  i3-msg reload
}
