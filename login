#!/bin/sh
#Excuted by WM .desktop start file

#Input configuration
#Set caps to escape
setxkbmap -option caps:escape

#Set the tablet pointer to only HDMI:0
xinput map-to-output 8 HDMI-0
