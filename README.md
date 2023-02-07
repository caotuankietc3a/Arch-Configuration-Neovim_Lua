# My Arch Configuration :house_with_garden:

## **Installation** :star2:

### **Dependecies** :rocket:

```
sudo pacman -S neovim rofi polybar zsh ranger alacritty dunst copyq feh flameshot pasystray network-manager-applet networkmanager pamixer pulseaudio light gpick gnome-keyring
```

```
yay -Sy picom-animations-git xbanish blueman onlyoffice-bin ibus-bamboo brave firefox visual-studio-code-bin
```

### colorls :file_folder:

```
gem install colorls

cp $(dirname $(gem which colorls))/yaml/dark_colors.yaml ~/.config/colorls/dark_colors.yaml
```

### nvim :cyclone:

```
yay -Sy cargo go luarocks ruby composer php npm nodejs python python-pip xsel
sudo pacman -Sy java java-runtime-common java-environment-common jdk-openjdk jre-openjdk wget curl tar gzip prettier stylua tidy yamllint flake8 eslint
```

### markdown-preview :zap:

```
sudo npm install markdownlint-cli2 -g
cd .local/share/nvim/site/pack/packer/start/markdown-preview.nvim/
yarn install
```

### **Learn more from caotuankietc3a** :ocean:

```
https://github.com/caotuankietc3a/Arch-Configuration-Neovim_Lua.git
```

# **Tokyo-night** :snowflake:

![image](https://github.com/caotuankietc3a/Arch-Configuration-Neovim_Lua/blob/main/Arch%20Config/My%20Custom%20Arch/Tokyo-night.png)

# **Tokyo-dark** :sunny:

![image](https://github.com/caotuankietc3a/Arch-Configuration-Neovim_Lua/blob/main/Arch%20Config/My%20Custom%20Arch/Tokyo-dark.png)
