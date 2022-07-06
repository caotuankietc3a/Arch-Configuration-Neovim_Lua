#!/bin/bash

Dunst_DIR="$HOME/.config/dunst"

# replacing dunst for beautiful notification
function dunst_changes() {
  if [ $1 == "tokyo-dark" ]
  then
    sed -i '57,60 s/background = .*/background = "#14141410"/1' $Dunst_DIR/dunstrc
    sed -i '57,60 s/foreground = .*/foreground = "#356eb0"/1' $Dunst_DIR/dunstrc
    sed -i '62,65 s/background = .*/background = "#14141410"/1' $Dunst_DIR/dunstrc
    sed -i '62,65 s/foreground = .*/foreground = "#356eb0"/1' $Dunst_DIR/dunstrc
    sed -i '0,/frame_color = .*/s//frame_color = "#FFB74D"/' $Dunst_DIR/dunstrc
  elif [ $1 == "dracula" ]
  then
    sed -i '57,60 s/background = .*/background = "#32344a80"/1' $Dunst_DIR/dunstrc 
    sed -i '57,60 s/foreground = .*/foreground = "#aeb1b8"/1' $Dunst_DIR/dunstrc
    sed -i '62,65 s/background = .*/background = "#32344a80"/1' $Dunst_DIR/dunstrc
    sed -i '62,65 s/foreground = .*/foreground = "#aeb1b8"/1' $Dunst_DIR/dunstrc
    sed -i '0,/frame_color = .*/s//frame_color = "#671e70"/' $Dunst_DIR/dunstrc
  elif [ $1 == "tokyo-night" ]
  then
    sed -i '57,60 s/background = .*/background = "#32344a80"/1' $Dunst_DIR/dunstrc 
    sed -i '57,60 s/foreground = .*/foreground = "#FFB74D"/1' $Dunst_DIR/dunstrc
    sed -i '62,65 s/background = .*/background = "#32344a80"/1' $Dunst_DIR/dunstrc
    sed -i '62,65 s/foreground = .*/foreground = "#FFB74D"/1' $Dunst_DIR/dunstrc
    sed -i '0,/frame_color = .*/s//frame_color = "#356eb0"/' $Dunst_DIR/dunstrc
  fi
}
