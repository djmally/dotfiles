#!/bin/sh
/usr/bin/VBoxClient-all

# Set mouse cursor
xsetroot -cursor_name left_ptr

# Set wallpaper
sh ~/.fehbg &

# Load .Xresources
xrdb -merge ~/.Xresources &

# Keyboard shortcuts daemon for bspwm
#sxhkd &

# Start WM
exec i3
#exec xmonad
#exec bspwm

