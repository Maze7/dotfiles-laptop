# Use device number matching touchpad, in this case 14
if [[ $(xinput list "SynPS/2 Synaptics TouchPad" | grep -Ec "disabled") -eq 1 ]]; then
    xinput enable "SynPS/2 Synaptics TouchPad"
    DISPLAY=:0 notify-send --urgency=critical --icon=/usr/share/icons/gnome/256x256/status/user-available.png "Touchpad enabled"
else
    xinput disable "SynPS/2 Synaptics TouchPad"
    DISPLAY=:0 notify-send --urgency=critical --icon=/usr/share/icons/gnome/256x256/status/user-busy.png "Touchpad disabled"
fi

exit 0
