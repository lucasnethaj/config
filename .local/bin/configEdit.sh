#!/bin/dash
# A fuzzy file-finder and opener based on rofi 
# Requires: rofi, xdg-utils, nerdfonts
files=/tmp/.edit_list

update_list() {
	find .config -type f>> /tmp/.edit_list
}
if [ -e $files ]; then
	# File list exist, use it
	input=$(cat $files | rofi -dmenu -p )
	# Update the list on the background
	update_list 
	else
	# There is no file list, create it and show menu only after that
	update_list
	input=$(cat $files | rofi -dmenu -p )
fi
	case "$(echo $input | cut -d " " -f 1)" in
		a)
			exec $BROWSER https://wiki.archlinux.org/index.php/"$(echo $input | cut -d " " -f2-)" &> /dev/null &
			;;
		w)
			exec $BROWSER https://en.wikipedia.org/wiki/"$(echo $input | cut -d " " -f2-)" &> /dev/null &
			;;
		s)
			exec $BROWSER "https://startpage.com/do/search?query=$(echo $input | cut -d " " -f2-)&cat=web&pl=chrome&language=english" &> /dev/null &
			;;
		*)
			exec xdg-open "$(echo $input | sed 's/^....//g')" &> /dev/null &
			;;
	esac
