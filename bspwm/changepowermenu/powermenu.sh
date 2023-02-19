#!/bin/bash
MENU="$(rofi -sep "|" -dmenu -i -p 'System' -theme ~/.config/polybar/themes/tokyo_night_powermenu.rasi <<< " Lock| Logout| Reboot| Shutdown| Suspend")"
# MENU="$(rofi -sep "|" -dmenu -i -p 'System' -width 10 -hide-scrollbar -line-padding 4 -padding 20 -lines 4 <<< " Lock| Logout| Reboot| Shutdown")"
            case "$MENU" in
                # *Lock) i3lock-fancy-rapid 8 5;;
                *Lock) i3lock-fancy ;;
                *Logout) i3-msg exit;;
                *Reboot) systemctl reboot ;;
                *Suspend) systemctl suspend ;;
                *Shutdown) systemctl -i poweroff
            esac
