#!/bin/bash

function send_notification() {
	brightness=$(light -G | cut -d '.' -f 1)
  if [ $brightness -ge 25 -a $brightness -lt 50 ]
  then
    dunstify -a "changebrightness" -u low -r 9991 -h int:value:"$brightness" -i "~/.config/dunst/icons/Itachi_Sharingan2.png" "Brightness: $brightness%" -t 2000
  elif [ $brightness -ge 50 -a $brightness -lt 65 ]
  then
    dunstify -a "changebrightness" -u low -r 9991 -h int:value:"$brightness" -i "~/.config/dunst/icons/Itachi_Sharingan3.png" "Brightness: $brightness%" -t 2000
  elif [ $brightness -ge 65 -a $brightness -lt 85 ]
  then
    dunstify -a "changebrightness" -u low -r 9991 -h int:value:"$brightness" -i "~/.config/dunst/icons/Itachi_Sharingan.png" "Brightness: $brightness%" -t 2000
  elif [ $brightness -ge 85 ]
  then
    dunstify -a "changebrightness" -u low -r 9991 -h int:value:"$brightness" -i "~/.config/dunst/icons/Itachi_Rinergan.png" "Brightness: $brightness%" -t 2000
  else
    dunstify -a "changebrightness" -u low -r 9991 -h int:value:"$brightness" -i "~/.config/dunst/icons/Itachi_Sharingan1.png" "Brightness: $brightness%" -t 2000
  fi
}

case $1 in
up)
  backlight_control +1
  send_notification $1
	;;
down)
  backlight_control -1
	send_notification $1
	;;
esac
