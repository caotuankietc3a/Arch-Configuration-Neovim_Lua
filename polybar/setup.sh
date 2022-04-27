# #!/bin/sh
# CurrentWorkspace=$(i3-msg -t get_workspaces \
# | jq '.[] | select(.focused==true).name' \
# | cut -d"\"" -f2)
# saveWorkspace=0
#
# # Need to install xdotool
# WINDOW=$(echo $(xwininfo -id $(xdotool getactivewindow) -stats | \
# egrep '(Width|Height):' | \
# awk '{print $NF}') | \
# sed -e 's/ /x/')
# SCREEN=$(xdpyinfo | grep -m1 dimensions | awk '{print $2}')
#
# if [ "$WINDOW" = "$SCREEN" ]; then
#   sed -i "s/60:class_g = 'Polybar'/00:class_g = 'Polybar'/g" ~/.config/picom.conf
#   sed -i "s/colors: .*/colors: *tokyo-night/g" ~/.config/alacritty/alacritty.yml
#   saveWorkspace = $CurrentWorkspace
# else
#   sed -i "s/00:class_g = 'Polybar'/60:class_g = 'Polybar'/g" ~/.config/picom.conf
# fi
#
#
# if [$CurrentWorkspace != $saveWorkspace]; then
#   sed -i "s/00:class_g = 'Polybar'/60:class_g = 'Polybar'/g" ~/.config/picom.conf
# fi
