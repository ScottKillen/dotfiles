alias bc='bc -l'
alias cls='clear'
alias fhere='find . -name '
alias free='free -mht'
alias mkdir='mkdir -pv'
alias mv='mv -iv'
alias rm='rm -Iv --one-file-system --preserve-root'
alias stow='stow -v'
alias t='todo-txt'
alias wget='wget -c'

function __add_command_replace_alias() {
  if has $2; then
    alias $1=$2
  fi
}

__add_command_replace_alias tail 'multitail'
__add_command_replace_alias df 'pydf'
__add_command_replace_alias du 'ncdu'
__add_command_replace_alias mail 's-nail'
__add_command_replace_alias traceroute 'mtr'
__add_command_replace_alias tracepath 'mtr'
__add_command_replace_alias top 'htop'

unset __add_command_replace_alias
