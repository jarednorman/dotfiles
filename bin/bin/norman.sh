#!/bin/sh
setxkbmap -v norman
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
