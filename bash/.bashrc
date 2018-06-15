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
# establish a sensible bash setup
#-------------------------------------------------------------
try_to_source ~/.sensible.bashrc

#-------------------------------------------------------------
# Include individual bash configuration files.
#-------------------------------------------------------------
source_everything_in ~/.bashrc.d

#-------------------------------------------------------------
# Set up liquidprompt
#-------------------------------------------------------------
try_to_source ~/.liquidprompt/liquidprompt
