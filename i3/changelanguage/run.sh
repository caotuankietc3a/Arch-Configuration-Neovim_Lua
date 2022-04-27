EN_ibus="xkb:us::eng"
VN_ibus="Bamboo"
lang=`ibus engine`


open_ibus_daemon=false
export open_ibus_daemon
if [ $open_ibus_daemon==false ]
then
  open_ibus_daemon=true
  ibus-daemon
  ibus engine $EN_ibus
fi

if [ $lang = $EN_ibus ]
then
  ibus engine $VN_ibus
  notify-send "Ibus" "Vietnamese" --icon="~/Pictures/Flag-Vietnam.jpg" -t 700 -a "System"
fi

if [ $lang = $VN_ibus ]
then
  ibus engine $EN_ibus
  notify-send "Ibus" "English" --icon="~/Pictures/Flag_of_the_United_States.svg" -t 700 -a "System"
fi
