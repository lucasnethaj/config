#!/bin/sh
#Excuted by WM .desktop start file

#Input configuration
#Set caps to escape
setxkbmap -option caps:escape

#Set the tablet pointer to only HDMI:0
xinput map-to-output 8 HDMI-0

#enable natural scrolling
xinput set-prop SynPs/2\ Synaptics\ Touchpad 286 1
