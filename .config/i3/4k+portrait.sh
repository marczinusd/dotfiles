#!/bin/sh
xrandr --output DisplayPort-0 --primary --mode 3840x2160 --pos 0x0 --rotate normal --output DisplayPort-1 --mode 1920x1080 --pos 3840x120 --rotate left --output

xrandr --output DisplayPort-0 --auto --output DisplayPort-1 --auto --scale 1.5x1.5 --right-of DisplayPort-0