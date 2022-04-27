#!/bin/bash
function send_notification() {
	volume=$(pamixer --get-volume)
  if [ $volume -gt 70 -a $volume -lt 100 ]
  then
    dunstify -a "changevolume" -u low -r 9993 -h int:value:"$volume" -i "~/.config/dunst/icons/volume_unmute3.png" "Volume: ${volume}%" -t 2000
  elif [ $volume -gt 40 -a $volume -le 70 ] 
  then
    dunstify -a "changevolume" -u low -r 9993 -h int:value:"$volume" -i "~/.config/dunst/icons/volume_unmute2.png" "Volume: ${volume}%" -t 2000
  elif [ $volume -gt 0 -a $volume -le 40 ]
  then
    dunstify -a "changevolume" -u low -r 9993 -h int:value:"$volume" -i "~/.config/dunst/icons/volume_unmute1.png" "Volume: ${volume}%" -t 2000
  elif [ $volume -ge 100 ]
  then
    dunstify -a "changevolume" -u low -r 9993 -h int:value:"$volume" -i "~/.config/dunst/icons/volume_unmute4.png" "Volume: ${volume}%" -t 2000
  fi
}

case $1 in
up)
	# Set the volume on (if it was muted)
	pamixer -u
	pamixer -i 1 --allow-boost
	send_notification
	;;
down)
	pamixer -u
	pamixer -d 1 --allow-boost
	send_notification
	;;
mute)
	pamixer -t
	if $(pamixer --get-mute); then
		dunstify -i "~/.config/dunst/icons/mute_volume.png" -a "changevolume" -t 2000 -r 9993 -u low "Muted"
	else
		send_notification up
	fi
	;;
esac
