# Greeting
set GREETING ' '(uname -r)                     # Kernel Release
set -a GREETING ' :'(pacman -Qq | wc -l)','    # Package Count
set -a GREETING (uptime --pretty)               # Uptime
echo -n $GREETING

source ~/.config/aliases
source ~/.config/profile
# Icons for file browser
test -f ~/.config/lf/lf_icons && source ~/.config/lf/lf_icons

bind \cB configEdit.sh
bind \cF lfcd

# Adds !! and !$ syntax for acessing previous command and argument
# bind ! __history_previous_command
bind \$ __history_previous_command_arguments
bind ! __history_number_command

function __history_number_command
  set n (commandline -t)
  if string match '!' $n
    commandline -t $history[1]; commandline -f repaint
  else if string match -r '^[0-9]+$' $n
    commandline -t $history[$n]; commandline -f repaint
  else
    commandline -i !
   end
end

function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case string match -r '*(\d+)!'
    commandline -t $history[$1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

# Color man pages
function man --wraps man --description 'Format and display manual pages'
    set -q man_blink; and set -l blink (set_color $man_blink); or set -l blink (set_color -o red)
    set -q man_bold; and set -l bold (set_color $man_bold); or set -l bold (set_color -o 5fafd7)
    set -q man_standout; and set -l standout (set_color $man_standout); or set -l standout (set_color 949494)
    set -q man_underline; and set -l underline (set_color $man_underline); or set -l underline (set_color -u afafd7)

    set -l end (printf "\e[0m")

    set -lx LESS_TERMCAP_mb $blink
    set -lx LESS_TERMCAP_md $bold
    set -lx LESS_TERMCAP_me $end
    set -lx LESS_TERMCAP_so $standout
    set -lx LESS_TERMCAP_se $end
    set -lx LESS_TERMCAP_us $underline
    set -lx LESS_TERMCAP_ue $end
    set -lx LESS '-R -s'

    set -lx GROFF_NO_SGR yes # fedora

    set -lx MANPATH (string join : $MANPATH)
    if test -z "$MANPATH"
        type -q manpath
        and set MANPATH (command manpath)
    end

    # Check data dir for Fish 2.x compatibility
    set -l fish_data_dir
    if set -q __fish_data_dir
        set fish_data_dir $__fish_data_dir
    else
        set fish_data_dir $__fish_datadir
    end

    set -l fish_manpath (dirname $fish_data_dir)/fish/man
    if test -d "$fish_manpath" -a -n "$MANPATH"
        set MANPATH "$fish_manpath":$MANPATH
        command man $argv
        return
    end
    command man $argv
end

# Set git prompt
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_hide_untrackedfiles 1

set -g __fish_git_prompt_color_branch magenta 
set -g __fish_git_prompt_showupstream "informative"
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_prefix ""

set -g __fish_git_prompt_char_stagedstate "●"
set -g __fish_git_prompt_char_dirtystate "✚"
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_conflictedstate "✖"
set -g __fish_git_prompt_char_cleanstate "✔"

set -g __fish_git_prompt_color_dirtystate blue
set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
set -g __fish_git_prompt_color_cleanstate green 

# SSH Agent 
function __ssh_agent_is_started -d "check if ssh agent is already started"
   if begin; test -f $SSH_ENV; and test -z "$SSH_AGENT_PID"; end
      source $SSH_ENV > /dev/null
   end

   if test -z "$SSH_AGENT_PID"
      return 1
   end

   ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep -q ssh-agent
   #pgrep ssh-agent
   return $status
end

function __ssh_agent_start -d "start a new ssh agent"
   ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
   chmod 600 $SSH_ENV
   source $SSH_ENV > /dev/null
   true  # suppress errors from setenv, i.e. set -gx
end


function fish_ssh_agent --description "Start ssh-agent if not started yet, or uses already started ssh-agent."
   if test -z "$SSH_ENV"
      set -xg SSH_ENV $HOME/.ssh/environment
   end

   if not __ssh_agent_is_started
      __ssh_agent_start
   end
end

fish_ssh_agent

# Start X at login
# if status is-login
#     if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
#         exec startx -- -keeptty
#     end
# end

# Start Sway at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec sway
    end
end
