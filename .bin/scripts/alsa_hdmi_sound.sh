#!/bin/sh

# Vorher die ~/.asoundrcoff ind ~/.asoundrc umbennen!
if [ ! -f ~/.asoundrc ]; then
	mv ~/.asoundrcoff ~/.asoundrc
elif [ ! -f ~/.asoundrcoff ]; then
	mv ~/.asoundrc ~/.asoundrcoff
fi
# Inhalt:
# pcm.!default {
# 	type hw
# 	card 0
# 	device
# }

alsactl kill quit
alsactl init

# Anwendungen neustarten!
