#!/bin/bash

ColorDIR="$HOME/.config/polybar/colours/colourful.ini"
ThemeDIR="$HOME/.config/polybar/themes"

# replacing colors in polybar
function polybar_changes() {
  if [ $1 == "tokyo-dark" ]
  then
    sed -i -e 's/background = .*/background = #2d568710/g' $ColorDIR
    sed -i -e 's/setting = .*/setting = #fa1414/g' $ColorDIR
    sed -i -e 's/wlan-ramp-signal = .*/wlan-ramp-signal = #9404d6/g' $ColorDIR
    sed -i -e 's/powermenu = .*/powermenu = #fa8541/g' $ColorDIR
    sed -i -e 's/xwindow = .*/xwindow = #a37233/g' $ColorDIR
    sed -i -e 's/change_theme = .*/change_theme = #faa434/g' $ColorDIR
    sed -i 's/date = .*/date = #fffc05/g' $ColorDIR
    sed -i -e 's/cpu = .*/cpu = #2263bf/g' $ColorDIR
    sed -i 's/border = .*/border = #61AFEF/g' $ColorDIR
    sed -i -e 's/i3-seperator = .*/i3-seperator = #cc9a74/g' $ColorDIR
    sed -i -e 's/i3-unfocus = .*/i3-unfocus = #d12662/g' $ColorDIR
    sed -i '0,/background: .*/s//background: #14141410;/' $ThemeDIR/tokyo_night_powermenu.rasi
    sed -i '0,/background: .*/s//background: #14141410;/' $ThemeDIR/tokyo_night_setting.rasi
    sed -i '0,/background: .*/s//background: #14141410;/' $ThemeDIR/tokyo_night_switch_theme.rasi
    sed -i '0,/foreground: .*/s//foreground: #7da6ff;/' $ThemeDIR/tokyo_night_switch_theme.rasi
    sed -i '0,/foreground: .*/s//foreground: #7da6ff;/' $ThemeDIR/tokyo_night_setting.rasi
    sed -i '0,/foreground: .*/s//foreground: #7da6ff;/' $ThemeDIR/tokyo_night_powermenu.rasi
    sed -i '0,/bright-blue: .*/s//bright-blue: #ff9e64f0;/' $ThemeDIR/tokyo_night_powermenu.rasi
    sed -i '0,/bright-blue: .*/s//bright-blue: #ff9e64f0;/' $ThemeDIR/tokyo_night_setting.rasi
    sed -i '0,/bright-blue: .*/s//bright-blue: #ff9e64f0;/' $ThemeDIR/tokyo_night_switch_theme.rasi
  elif [ $1 == "dracula" ]
  then
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
    sed -i '0,/background: .*/s//background: rgba(40,44,52,0.8);/' $ThemeDIR/tokyo_night_powermenu.rasi
    sed -i '0,/background: .*/s//background: rgba(40,44,52,0.8);/' $ThemeDIR/tokyo_night_setting.rasi
    sed -i '0,/background: .*/s//background: rgba(40,44,52,0.8);/' $ThemeDIR/tokyo_night_switch_theme.rasi
    sed -i '0,/foreground: .*/s//foreground: #aeb1b8;/' $ThemeDIR/tokyo_night_switch_theme.rasi
    sed -i '0,/foreground: .*/s//foreground: #aeb1b8;/' $ThemeDIR/tokyo_night_setting.rasi
    sed -i '0,/foreground: .*/s//foreground: #aeb1b8;/' $ThemeDIR/tokyo_night_powermenu.rasi
    sed -i '0,/bright-blue: .*/s//bright-blue: #c678dd;/' $ThemeDIR/tokyo_night_powermenu.rasi
    sed -i '0,/bright-blue: .*/s//bright-blue: #c678dd;/' $ThemeDIR/tokyo_night_setting.rasi
    sed -i '0,/bright-blue: .*/s//bright-blue: #c678dd;/' $ThemeDIR/tokyo_night_switch_theme.rasi
  elif [ $1 == "tokyo-night" ]
  then
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
    sed -i '0,/background: .*/s//background: rgba(40,44,52,0.8);/' $ThemeDIR/tokyo_night_powermenu.rasi
    sed -i '0,/background: .*/s//background: rgba(40,44,52,0.8);/' $ThemeDIR/tokyo_night_setting.rasi
    sed -i '0,/background: .*/s//background: rgba(40,44,52,0.8);/' $ThemeDIR/tokyo_night_switch_theme.rasi
    sed -i '0,/foreground: .*/s//foreground: #ff9e64f0;/' $ThemeDIR/tokyo_night_switch_theme.rasi
    sed -i '0,/foreground: .*/s//foreground: #ff9e64f0;/' $ThemeDIR/tokyo_night_setting.rasi
    sed -i '0,/foreground: .*/s//foreground: #ff9e64f0;/' $ThemeDIR/tokyo_night_powermenu.rasi
    sed -i '0,/bright-blue: .*/s//bright-blue: #7da6ff;/' $ThemeDIR/tokyo_night_powermenu.rasi
    sed -i '0,/bright-blue: .*/s//bright-blue: #7da6ff;/' $ThemeDIR/tokyo_night_setting.rasi
    sed -i '0,/bright-blue: .*/s//bright-blue: #7da6ff;/' $ThemeDIR/tokyo_night_switch_theme.rasi
  fi
}
