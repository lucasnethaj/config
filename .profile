# $HOME/.profile

#Set our umask
umask 022

# Set our default path
#PATH="/usr/local/sbin:/usr/local/bin:/usr/bin/core_perl:/usr/bin:$HOME/.config/bspwm/panel:$HOME/.bin"
export PANEL_FIFO="/tmp/panel-fifo"
export PATH
export XDG_CONFIG_HOME="$HOME/.config"
export BSPWM_SOCKET="/tmp/bspwm-socket"
export PANEL_HEIGHT=25
export XDG_CONFIG_DIRS=/usr/etc/xdg:/etc/xdg
export GUI_EDITOR=/usr/bin/nvim
export BROWSER=/usr/bin/firefox
export TERMINAL=/usr/bin/xterm
export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtkrc-2.0"
export PATH="$HOME/bin":$PATH
export GOROOT=/usr/local/go
export GOPATH=$HOME/dev/
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
source $HOME/.aliases

# cleanup
export SSH="$XDG_CONFIG_HOME/ssh"

# Load profiles from /etc/profile.d
if test -d /etc/profile.d/; then
	for profile in /etc/profile.d/*.sh; do
		test -r "$profile" && . "$profile"
	done
	unset profile
fi

# Termcap is outdated, old, and crusty, kill it.
unset TERMCAP

# Man is much better than us at figuring this out
unset MANPATH
