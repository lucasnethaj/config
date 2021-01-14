# $HOME/.profile

#Set our umask
umask 022

# Set our default path
#PATH="/usr/local/sbin:/usr/local/bin:/usr/bin/core_perl:/usr/bin:$HOME/.config/bspwm/panel:$HOME/.bin"
export PANEL_FIFO="/tmp/panel-fifo"
#export PATH
set PATH "$HOME/.local/go/bin:$HOME/.local/bin"
export XDG_CONFIG_HOME="$HOME/.config"
export BSPWM_SOCKET="/tmp/bspwm-socket"
export PANEL_HEIGHT=25
export XDG_CONFIG_DIRS=/usr/etc/xdg:/etc/xdg
export GUI_EDITOR=/usr/bin/nvim
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
export BROWSER=/usr/bin/firefox
export TERMINAL=/usr/local/bin/st
export FILEBROWSER=/usr/bin/lf
export GUI_FILEBROWSER=/usr/bin/thunar
export QT_QPA_PLATFORMTHEME="qt5ct"
export LESSHISTFILE=-
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtkrc-2.0"
export GOPATH="$HOME/.local/go"

# cleanup
export SSH="$XDG_CONFIG_HOME/ssh"

# Load profiles from /etc/profile.d
#Source /etc/profile directly instead which does the same
source /etc/profile

# Source global bash config
#if test "$PS1" && test "$BASH" && test -r /etc/bash.bashrc; then
	#. /etc/bash.bashrc
#fi

# Termcap is outdated, old, and crusty, kill it.
unset TERMCAP

# Man is much better than us at figuring this out
unset MANPATH
