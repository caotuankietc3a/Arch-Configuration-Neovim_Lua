#!/bin/bash

ALDIR="$HOME/.config/alacritty/alacritty.yml"
NvimDIR="$HOME/.config/nvim/lua/caparies/config/lualine.lua"
ColorlsDIR="$HOME/.config/colorls/dark_colors.yaml"
Zsh_DIR="$HOME/.config/zsh"

function zsh_changes() {
  if [ $1 == "tokyo-dark" ]
  then
    # Changing colors of zsh and clorls
    sed -i "s/colors: .*/colors: *tokyo-night-storm/g" $ALDIR
    sed -i -e 's/unrecognized_file: .*/unrecognized_file: red/g' $ColorlsDIR
    sed -i -e 's/dir: .*/dir:  "#ff8a0d"/g' $ColorlsDIR
    sed -i 's/\<recognized_file\>: .*/recognized_file:  "#cf42ab"/g' $ColorlsDIR
    sed -i '34,36 s/yellow/blue/g' $Zsh_DIR/zsh-prompt
    sed -i '34,36 s/magenta/red/1' $Zsh_DIR/zsh-prompt
    # replacing theme in neovim
    sed -i '0,/colorscheme .*/s//colorscheme tokyodark/' $NvimDIR
  elif [ $1 == "dracula" ]
  then
    # Changing colors of zsh and clorls
    sed -i "s/colors: .*/colors: *dracula/g" $ALDIR
    sed -i 's/unrecognized_file: .*/unrecognized_file: orangered/g' $ColorlsDIR
    sed -i 's/dir: .*/dir: violet/g' $ColorlsDIR
    sed -i 's/\<recognized_file\>: .*/recognized_file: lightgreen/g' $ColorlsDIR
    sed -i '34,36 s/blue/yellow/g' $Zsh_DIR/zsh-prompt
    sed -i '34,36 s/red/magenta/1' $Zsh_DIR/zsh-prompt
    # replacing theme in neovim
    sed -i '0,/colorscheme .*/s//colorscheme catppuccin/' $NvimDIR
  elif [ $1 == "tokyo-night" ]
  then
    # Changing colors of zsh and clorls
    sed -i "s/colors: .*/colors: *tokyo-night/g" $ALDIR
    sed -i 's/unrecognized_file: .*/unrecognized_file: gold/g' $ColorlsDIR
    sed -i 's/dir: .*/dir: dodgerblue/g' $ColorlsDIR
    sed -i 's/\<recognized_file\>: .*/recognized_file: yellow/g' $ColorlsDIR
    sed -i '34,36 s/yellow/blue/g' $Zsh_DIR/zsh-prompt
    sed -i '34,36 s/magenta/red/1' $Zsh_DIR/zsh-prompt
    # replacing theme in neovim
    sed -i '0,/colorscheme .*/s//colorscheme tokyonight/' $NvimDIR
  fi
  i3-msg reload
}
