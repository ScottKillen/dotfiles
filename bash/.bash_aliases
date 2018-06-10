# vim: ai ts=2 sw=2 et sts=2 ft=sh

alias bc='bc -l'
alias cls='clear'
alias fhere='find . -name '
alias free='free -mht'

alias grep='grep $__COLOR_OPTIONS'
alias egrep='egrep $__COLOR_OPTIONS'
alias fgrep='fgrep $__COLOR_OPTIONS'

alias h.='history'
alias hf='history | grep'

alias ll='ls -lA'
alias ls='ls -hCF $__COLOR_OPTIONS'
alias lsl='ls -lFA | less'
alias dir='dir -h $__COLOR_OPTIONS'
alias vdir='vdir -h $__COLOR_OPTIONS'

alias mkdir='mkdir -pv'
alias mv='mv -iv'

alias ps='ps aux'
alias pf='ps -e | grep'
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'

alias rm='rm -Iv --one-file-system --preserve-root'
alias stow='stow -v'
alias t='todo-txt'
alias wget='wget -c'

# function checks if the application is installed
function __add_command_replace_alias() {
  if [ -x "`which $2 2>&1`" ]; then
    alias $1=$2
  fi
}

__add_command_replace_alias tail 'multitail'
__add_command_replace_alias df 'pydf'
__add_command_replace_alias du 'ncdu'
__add_command_replace_alias traceroute 'mtr'
__add_command_replace_alias tracepath 'mtr'
__add_command_replace_alias top 'htop'

unset __add_command_replace_alias

alias myip='curl http://ipecho.net/plain; echo'
