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

if  [[ $1 = "tokyonight" ]]; then

  # Changing colors of polybar
  sed -i 's/background = .*/background = #555555e0/g' $ColorDIR
  sed -i 's/setting = .*/setting = #069c0b/g' $ColorDIR
  sed -i 's/wlan-ramp-signal = .*/wlan-ramp-signal = #CE93D8/g' $ColorDIR
  sed -i 's/powermenu = .*/powermenu = #356eb0/g' $ColorDIR
  sed -i 's/xwindow = .*/xwindow = #356eb0/g' $ColorDIR
  sed -i 's/change_theme = .*/change_theme = #356eb0/g' $ColorDIR
  sed -i 's/cpu = .*/cpu = #00e1ff/g' $ColorDIR
  sed -i 's/date = .*/date = #fffc05/g' $ColorDIR
  sed -i 's/border = .*/border = #fa8541/g' $ColorDIR
  sed -i 's/i3-seperator = .*/i3-seperator = #2d9683/g' $ColorDIR
  sed -i 's/i3-unfocus = .*/i3-unfocus = #fc607c/g' $ColorDIR
  sed -i "s/colors: .*/colors: *tokyo-night/g" $ALDIR
  sed -i '0,/colorscheme .*/s//colorscheme tokyonight/' $NvimDIR
  sed -i '0,/set $ac .*/s//set $ac #61AFEF/' $I3DIR
  sed -i '0,/background: .*/s//background: rgba(40,44,52,0.8);/' $ThemeDIR/tokyo_night_powermenu.rasi
  sed -i '0,/background: .*/s//background: rgba(40,44,52,0.8);/' $ThemeDIR/tokyo_night_setting.rasi
  sed -i '0,/background: .*/s//background: rgba(40,44,52,0.8);/' $ThemeDIR/tokyo_night_switch_theme.rasi
  sed -i '0,/foreground: .*/s//foreground: #ff9e64f0;/' $ThemeDIR/tokyo_night_switch_theme.rasi
  sed -i '0,/foreground: .*/s//foreground: #ff9e64f0;/' $ThemeDIR/tokyo_night_setting.rasi
  sed -i '0,/foreground: .*/s//foreground: #ff9e64f0;/' $ThemeDIR/tokyo_night_powermenu.rasi
  sed -i '0,/bright-blue: .*/s//bright-blue: #7da6ff;/' $ThemeDIR/tokyo_night_powermenu.rasi
  sed -i '0,/bright-blue: .*/s//bright-blue: #7da6ff;/' $ThemeDIR/tokyo_night_setting.rasi
  sed -i '0,/bright-blue: .*/s//bright-blue: #7da6ff;/' $ThemeDIR/tokyo_night_switch_theme.rasi

  # Changing colors of zsh and clorls
  sed -i 's/unrecognized_file: .*/unrecognized_file: gold/g' $ColorlsDIR
  sed -i 's/dir: .*/dir: dodgerblue/g' $ColorlsDIR
  sed -i 's/\<recognized_file\>: .*/recognized_file: yellow/g' $ColorlsDIR

  # Changing colors of dunst
  sed -i '57,60 s/background = .*/background = "#32344a80"/1' $Dunst_DIR/dunstrc 
  sed -i '57,60 s/foreground = .*/foreground = "#FFB74D"/1' $Dunst_DIR/dunstrc
  sed -i '62,65 s/background = .*/background = "#32344a80"/1' $Dunst_DIR/dunstrc
  sed -i '62,65 s/foreground = .*/foreground = "#FFB74D"/1' $Dunst_DIR/dunstrc
  sed -i '0,/frame_color = .*/s//frame_color = "#356eb0"/' $Dunst_DIR/dunstrc

  # Changing Wallpapers
  sed -i '0,/set $randompicture exec feh --bg-scale --randomize .*/s//set $randompicture exec feh --bg-scale --randomize ~\/.config\/Arch\\ Config\/Anime\/*/' $I3DIR

  # Changing colors of powermenu of rofi
  sed -i '0,/background: .*/s//background: #32344a80;/' $Powermenu_Rofi_DIR/styles/colors.rasi
  sed -i '0,/background-inputbar: .*/s//background-inputbar: #2A3950ff;/' $Powermenu_Rofi_DIR/styles/colors.rasi
  sed -i '0,/foreground: .*/s//foreground: #ff9e64;/' $Powermenu_Rofi_DIR/styles/colors.rasi
  sed -i '0,/border: .*/s//border: #7da6ff;/' $Powermenu_Rofi_DIR/styles/colors.rasi

  # Changing colors of powermenu of zsh-prompt
  sed -i '34,36 s/yellow/blue/g' $Zsh_DIR/zsh-prompt
  sed -i '34,36 s/magenta/red/1' $Zsh_DIR/zsh-prompt

  # handle command
  notify-send "Change Theme" "Tokyo Night" --icon="$Icon_Theme_DIR/Tokyo-night.png" -t 1500 -a "System"
  sleep 1
  i3-msg reload
  flameshot config -m "#61AFEF"
  feh --bg-scale --randomize ~/.config/Arch\ Config/Anime/*
  pkill dunst
  dunst &
  $HOME/.config/polybar/launch.sh
  zsh
fi
