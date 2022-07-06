#!/bin/bash

# replacing color flameshot
function flameshot_changes() {
  if [ $1 == "tokyo-dark" ]
  then
    flameshot config -m "#fa8541"
  elif [ $1 == "dracula" ]
  then
    flameshot config -m "#c678dd"
  elif [ $1 == "tokyo-night" ]
  then
    flameshot config -m "#61AFEF"
  fi
}
