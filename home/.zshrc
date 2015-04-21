# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=1000
setopt nomatch
unsetopt appendhistory autocd beep extendedglob notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/djmally/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

if [ "$TMUX" != "" ]; then vim +qall; fi

alias ls='ls --color=yes'
alias fuck='$(thefuck $(fc -ln -1))'
export PATH=/home/djmally/.gem/ruby/2.1.0/bin:$PATH
export PATH=/home/djmally/.gem/ruby/2.2.0/bin:$PATH

export GREP_COLOR='1;32;40'

# Function to switch and save the current path
function cd() {
  builtin cd "$@";
  echo "$PWD" > ~/.cwd;
}
export cd
alias cwd='cd "$(cat ~/.cwd)"'

#PROMPT='%n@%m%# '
PROMPT_WD=$(pwd | tail -c 15)
#PROMPT='...%{$(pwd|tail -c 15|grep --color=always /)%${#PWD}G%} %(!.%F{white}.%F{red})%n%f@%F{blue}%m%f%(!.%F{magenta}.)%#%f '
PROMPT='%(!.%F{white}.%F{yellow})%n%f@%F{cyan}%m%f%(!.%F{magenta}.)%#%f '

# OPAM configuration
. /home/djmally/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
export PATH="/home/djmally/.rbenv/shims:${PATH}"
source "/usr/lib/rbenv/libexec/../completions/rbenv.zsh"
rbenv rehash 2>/dev/null
rbenv() {
  typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval `rbenv "sh-$command" "$@"`;;
  *)
    command rbenv "$command" "$@";;
  esac
}

setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{6}(%f%s%F{6})%F{3}-%F{6}[%F{3}%b%F{6}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn

zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==32=35}:${(s.:.)LS_COLORS}")'

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}
RPROMPT=$'$(vcs_info_wrapper)'
