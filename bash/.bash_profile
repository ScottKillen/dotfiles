# vi:syntax=sh

# Source .bashrc as recommended here:
# http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html

[[ -f ~/.bashrc ]] && . ~/.bashrc

[[ -f ~/.profile ]] && . ~/.profile

mesg n
printf "\n"

#-------------------------------------------------------------
# pathadd: append $1 to $PATH if not already there
#-------------------------------------------------------------
pathadd()
{
  [[ ":$PATH:" =~ ":$1:" ]] || PATH=$PATH${PATH:+:}$1  # append if NOT already in PATH, suppress first ':'
}

#-------------------------------------------------------------
# addpath: prepend $1 to $PATH if not already there
#-------------------------------------------------------------
addpath()
{
  [[ ":$PATH:" =~ ":$1:" ]] || PATH=$1${PATH:+:}$PATH  # prepend if NOT already in PATH, suppress first ':'
}

#-------------------------------------------------------------
# Set path
#-------------------------------------------------------------
addpath ~/.local/bin
addpath ~/bin
addpath ~/gems/bin
addpath ~/.global-modules/bin

