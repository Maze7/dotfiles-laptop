#!/bin/sh
# Make sure this is before the 'exec' command or it won't be sourced.

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

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

# Load xprofile 
#[ -f /etc/xprofile ] && . /etc/xprofile
#[ -f ~/.xprofile ] && . ~/.xprofile

# keyboard settings
setxkbmap de
setxkbmap -option caps:escape 
xinput --disable "SynPS/2 Synaptics TouchPad"
#xinput set-prop "TPPS/2 IBM TrackPoint" "287" "-0.3" #libinput
#xinput set-prop "TPPS/2 IBM TrackPoint" "275" "0.75" #evde
xinput set-prop "TPPS/2 IBM TrackPoint" "Device Accel Constant Deceleration" 0.7

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Least
exec i3
