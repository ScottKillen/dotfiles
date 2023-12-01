#-------------------------------------------------------------
# enable color support
#-------------------------------------------------------------
export COLORTERM=truecolor
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  export __COLOR_OPTIONS='--color=auto'
  export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
else
  export __COLOR_OPTIONS=''
  unset GCC_COLORS
fi

