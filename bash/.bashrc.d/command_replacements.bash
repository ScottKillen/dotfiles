alias bc='bc --mathlib'
alias cls='clear'
alias fhere='find . -name '
alias free='free --mebi --human --total'
alias lqtag='liquidprompt_tag'
alias mkdir='mkdir --parents --verbose'
alias mv='mv --interactive --verbose'
alias rm='rm --interactive=once --verbose --one-file-system --preserve-root'
alias stow='stow --verbose'
alias t='todo-txt -c -d ~/.todoconfig'
alias wget='wget --continue'

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
