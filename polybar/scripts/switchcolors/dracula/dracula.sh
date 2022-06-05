#!/bin/bash

ColorDIR="$HOME/.config/polybar/colours/colourful.ini"
ALDIR="$HOME/.config/alacritty/alacritty.yml"
NvimDIR="$HOME/.config/nvim/lua/caparies/colorscheme.lua"
I3DIR="$HOME/.config/i3/config"
ThemeDIR="$HOME/.config/polybar/themes"
Powermenu_Rofi_DIR="$HOME/.config/rofi/powermenu/"
ColorlsDIR="$HOME/.config/colorls/dark_colors.yaml"
Icon_Theme_DIR="$HOME/.config/Arch Config/My Custom Arch"
Dunst_DIR="$HOME/.config/dunst"
Zsh_DIR="$HOME/.config/zsh"

if  [[ $1 = "dracula" ]]; then

  # Changing colors of polybar
  sed -i 's/background = .*/background = #141414/g' $ColorDIR
  sed -i 's/setting = .*/setting = #fa8541/g' $ColorDIR
  sed -i 's/wlan-ramp-signal = .*/wlan-ramp-signal = #d00eed/g' $ColorDIR
  sed -i 's/powermenu = .*/powermenu = #d300c4/g' $ColorDIR
  sed -i 's/xwindow = .*/xwindow = #aeb1b8/g' $ColorDIR
  sed -i 's/change_theme = .*/change_theme = #c7126c/g' $ColorDIR
  sed -i 's/date = .*/date = #aeb1b8/g' $ColorDIR
  sed -i 's/cpu = .*/cpu = #42a89e/g' $ColorDIR
  sed -i 's/border = .*/border = #c678dd/g' $ColorDIR
  sed -i 's/i3-seperator = .*/i3-seperator = #c678dd/g' $ColorDIR
  sed -i 's/i3-unfocus = .*/i3-unfocus = #fc607c/g' $ColorDIR
  sed -i "s/colors: .*/colors: *dracula/g" $ALDIR
  sed -i '0,/colorscheme .*/s//colorscheme dracula/' $NvimDIR
  sed -i '0,/set $ac .*/s//set $ac #c678dd/' $I3DIR
  sed -i '0,/background: .*/s//background: rgba(40,44,52,0.8);/' $ThemeDIR/tokyo_night_powermenu.rasi
  sed -i '0,/background: .*/s//background: rgba(40,44,52,0.8);/' $ThemeDIR/tokyo_night_setting.rasi
  sed -i '0,/background: .*/s//background: rgba(40,44,52,0.8);/' $ThemeDIR/tokyo_night_switch_theme.rasi
  sed -i '0,/foreground: .*/s//foreground: #aeb1b8;/' $ThemeDIR/tokyo_night_switch_theme.rasi
  sed -i '0,/foreground: .*/s//foreground: #aeb1b8;/' $ThemeDIR/tokyo_night_setting.rasi
  sed -i '0,/foreground: .*/s//foreground: #aeb1b8;/' $ThemeDIR/tokyo_night_powermenu.rasi
  sed -i '0,/bright-blue: .*/s//bright-blue: #c678dd;/' $ThemeDIR/tokyo_night_powermenu.rasi
  sed -i '0,/bright-blue: .*/s//bright-blue: #c678dd;/' $ThemeDIR/tokyo_night_setting.rasi
  sed -i '0,/bright-blue: .*/s//bright-blue: #c678dd;/' $ThemeDIR/tokyo_night_switch_theme.rasi

  # Changing colors of zsh and clorls
  sed -i 's/unrecognized_file: .*/unrecognized_file: orangered/g' $ColorlsDIR
  sed -i 's/dir: .*/dir: violet/g' $ColorlsDIR
  sed -i 's/\<recognized_file\>: .*/recognized_file: lightgreen/g' $ColorlsDIR

  # Changing colors of dunst
  sed -i '57,60 s/background = .*/background = "#32344a80"/1' $Dunst_DIR/dunstrc 
  sed -i '57,60 s/foreground = .*/foreground = "#aeb1b8"/1' $Dunst_DIR/dunstrc
  sed -i '62,65 s/background = .*/background = "#32344a80"/1' $Dunst_DIR/dunstrc
  sed -i '62,65 s/foreground = .*/foreground = "#aeb1b8"/1' $Dunst_DIR/dunstrc
  sed -i '0,/frame_color = .*/s//frame_color = "#671e70"/' $Dunst_DIR/dunstrc

  # Changing Wallpapers
  sed -i -e 's/Spaces/Anime/g' $I3DIR

  # Changing colors of powermenu of rofi
  sed -i '0,/background: .*/s//background: #141414;/' $Powermenu_Rofi_DIR/styles/colors.rasi
  sed -i '0,/background-inputbar: .*/s//background-inputbar: #2A3950ff;/' $Powermenu_Rofi_DIR/styles/colors.rasi
  sed -i '0,/foreground: .*/s//foreground: #aeb1b8;/' $Powermenu_Rofi_DIR/styles/colors.rasi
  sed -i '0,/border: .*/s//border: #671e70;/' $Powermenu_Rofi_DIR/styles/colors.rasi

  # Changing colors of powermenu of zsh-prompt
  sed -i '34,36 s/blue/yellow/g' $Zsh_DIR/zsh-prompt
  sed -i '34,36 s/red/magenta/1' $Zsh_DIR/zsh-prompt

  # handle command
  notify-send "Change Theme" "Dracula" --icon="$Icon_Theme_DIR/Tokyo-night.png" -t 1500 -a "System"
  sleep 1
  i3-msg reload
  flameshot config -m "#c678dd"
  feh --bg-scale --randomize ~/.config/Arch\ Config/Anime/*
  pkill dunst
  dunst &
  $HOME/.config/polybar/launch.sh
fi
