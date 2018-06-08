# =============================================================== #
# ~/.bashrc: executed by bash(1) for non-login shells.
# =============================================================== #

#-------------------------------------------------------------
# If not running interactively, don't do anything
#-------------------------------------------------------------
case $- in
    *i*) ;;
      *) return;;
esac

#-------------------------------------------------------------
# Source global definitions (if any)
#-------------------------------------------------------------


if [ -f /etc/bashrc ]; then
      . /etc/bashrc   # --> Read /etc/bashrc, if present.
fi

#-------------------------------------------------------------
# Sensible Bash
# An attempt at saner Bash defaults.
#-------------------------------------------------------------

if [ -f ~/.bash/sensible.bash ]; then
    . ~/.bash/sensible.bash
fi

#-------------------------------------------------------------
# make less more friendly for non-text input files, see lesspipe(1)
#-------------------------------------------------------------
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

#-------------------------------------------------------------
# set up prompt
#-------------------------------------------------------------

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Only load Liquid Prompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source ~/src/liquidprompt/liquidprompt

#-------------------------------------------------------------
# enable color support
#-------------------------------------------------------------
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  export __COLOR_OPTIONS='--color=auto'
  export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
  #alias ls='ls -CF --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  #alias grep='grep --color=auto'
  #alias fgrep='fgrep --color=auto'
  #alias egrep='egrep --color=auto'
else
  export __COLOR_OPTIONS=''
  unset GCC_COLORS
fi

#-------------------------------------------------------------
# colored GCC warnings and errors
#-------------------------------------------------------------
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

#-------------------------------------------------------------
# set editor
#-------------------------------------------------------------
export EDITOR=vim

#-------------------------------------------------------------
# cdable vars
#-------------------------------------------------------------
export bash="$HOME/.bash"
export bin="$HOME/bin"
export dotfiles="$HOME/dotfiles"
export src="$HOME/src"

#-------------------------------------------------------------
# Alias definitions.
#-------------------------------------------------------------

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#-------------------------------------------------------------
# Function definitions.
#-------------------------------------------------------------

if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

#-------------------------------------------------------------
# Completions
#-------------------------------------------------------------
if [ -f ~/.bash/completions/git.completion.bash ]; then
  . ~/.bash/completions/git.completion.bash
fi

if [ -f ~/.bash/completions/tmux.completion.bash ]; then
  . ~/.bash/completions/tmux.completion.bash
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#-------------------------------------------------------------
# Set path
#-------------------------------------------------------------
addpath ~/.local/bin
addpath ~/bin

#-------------------------------------------------------------
# Set GPG tty
#-------------------------------------------------------------
export GPG_TTY=$(tty)
