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
# Utility functions used for including othe configuration
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
# Include individual bash configuration files.
#-------------------------------------------------------------

source_everything_in ~/.bashrc.d

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
