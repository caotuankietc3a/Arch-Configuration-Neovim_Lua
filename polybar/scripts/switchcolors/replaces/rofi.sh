#!/bin/bash

Powermenu_Rofi_DIR="$HOME/.config/rofi/powermenu/"

# replacing powermenu in rofi dir
function rofi_changes() {
  if [ $1 == "tokyo-dark" ]
  then
    sed -i '0,/background: .*/s//background: #14141410;/' $Powermenu_Rofi_DIR/styles/colors.rasi
    sed -i '0,/background-inputbar: .*/s//background-inputbar: #14141410;/' $Powermenu_Rofi_DIR/styles/colors.rasi
    sed -i '0,/foreground: .*/s//foreground: #7da6ff;/' $Powermenu_Rofi_DIR/styles/colors.rasi
    sed -i '0,/border: .*/s//border: #ff9e64;/' $Powermenu_Rofi_DIR/styles/colors.rasi
  elif [ $1 == "dracula" ]
  then
    sed -i '0,/background: .*/s//background: #141414;/' $Powermenu_Rofi_DIR/styles/colors.rasi
    sed -i '0,/background-inputbar: .*/s//background-inputbar: #2A3950ff;/' $Powermenu_Rofi_DIR/styles/colors.rasi
    sed -i '0,/foreground: .*/s//foreground: #aeb1b8;/' $Powermenu_Rofi_DIR/styles/colors.rasi
    sed -i '0,/border: .*/s//border: #671e70;/' $Powermenu_Rofi_DIR/styles/colors.rasi
  elif [ $1 == "tokyo-night" ]
  then
    sed -i '0,/background: .*/s//background: #32344a80;/' $Powermenu_Rofi_DIR/styles/colors.rasi
    sed -i '0,/background-inputbar: .*/s//background-inputbar: #2A3950ff;/' $Powermenu_Rofi_DIR/styles/colors.rasi
    sed -i '0,/foreground: .*/s//foreground: #ff9e64;/' $Powermenu_Rofi_DIR/styles/colors.rasi
    sed -i '0,/border: .*/s//border: #7da6ff;/' $Powermenu_Rofi_DIR/styles/colors.rasi
  fi
}
