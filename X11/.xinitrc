#!/bin/sh

userresources=$HOME/.config/X11/.Xresources
userprofile=$HOME/.config/X11/.xprofile
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [ -f "$userprofile" ]; then
  source "$userprofile"
fi

if [ -f $sysresources ]; then
  xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
  xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
  xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
  xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# load Xresources
# source $HOME/.config/X11/.Xresources

# load xprofile
# source $HOME/.config/X11/.xprofile

# eval $(gnome-keyring-daemon --start)
# export SSH_AUTH_SOCK

# must be in bottom
# exec i3
# exec dwm
exec bspwm
