# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
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
export PATH=/home/djmally/.gem/ruby/2.1.0/bin:$PATH

# Function to switch and save the current path
function cd() {
  builtin cd "$@";
  echo "$PWD" > ~/.cwd;
}
export cd
alias cwd='cd "$(cat ~/.cwd)"'

PROMPT='%n@%m%# '
