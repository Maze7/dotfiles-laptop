#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done


# get primary monitor
POLYBARMON=$(xrandr | grep "connected primary" | awk '{ print$1 }')


# Launch bar1
POLYBARMON=$POLYBARMON polybar -c "$HOME/.config/polybar/config" top &
