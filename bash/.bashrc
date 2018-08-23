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
# source stuff specific to thias machine
#-------------------------------------------------------------
try_to_source ~/.config/bashrc_${HOSTNAME}

if [[ -x ~/bin/screenfetch ]]; then
  ~/bin/screenfetch
fi

