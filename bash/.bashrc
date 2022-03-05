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
# Utility functions used for including the configuration
# files
#-------------------------------------------------------------

try_to_source() {
  local file="${1}"

  [[ -f "${file}" && -r "${file}" ]] && . "${file}"
}

source_everything_in() {
  local dir="${1}"

  if [[ -d "${dir}" && -r "${dir}" && -x "${dir}" ]]; then
    for file in "${dir}"/*; do
      try_to_source "${file}"
    done
  fi
}

has() {
  hash "$@" &>/dev/null
}

export COLORTERM=truecolor
#-------------------------------------------------------------
# Source global definitions (if any)
#-------------------------------------------------------------

try_to_source /etc/bashrc

#-------------------------------------------------------------
# establish a sensible bash setup
#-------------------------------------------------------------
try_to_source ~/.sensible.bashrc
stty -ixon

#-------------------------------------------------------------
# Include individual bash configuration files.
#-------------------------------------------------------------
source_everything_in ~/.bashrc.d

#-------------------------------------------------------------
# Set up prompt
#-------------------------------------------------------------
try_to_source /usr/share/liquidprompt/liquidprompt
# try_to_source ~/bin/bash-powerline.sh

#-------------------------------------------------------------
# source stuff specific to this machine
#-------------------------------------------------------------
try_to_source ~/.config/bashrc_${HOSTNAME}

if [[ -x ~/bin/screenfetch ]]; then
  ~/bin/screenfetch
fi

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# Only load liquidprompt in interactive shells, not from a script or from scp
# echo $- | grep -q i 2>/dev/null && . /usr/share/liquidprompt/liquidprompt

# load starship
eval "$(starship init bash)"
