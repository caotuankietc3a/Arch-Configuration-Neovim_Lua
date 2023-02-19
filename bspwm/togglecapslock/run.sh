CapsDIR="$HOME/.config/Arch Config/Caps Lock"
xdotool key Caps_Lock
state=`xset -q | grep 'Caps Lock' | awk '{print $4}'`

if [ $state == 'off' ]
then
  killall dunst
  dunstify "CapsLock" "Off" --icon="$CapsDIR/caps-lock-off.png" -t 700 -a "System"
else
  killall dunst
  dunstify "CapsLock" "On" --icon="$CapsDIR/caps-lock-on.jpg" -t 700 -a "System"
fi
