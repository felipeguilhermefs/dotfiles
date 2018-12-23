export ZSH=~/.oh-my-zsh

# Theme
ZSH_THEME="af-magic"

# Plugins
plugins=(git ssh-agent)

source $ZSH/oh-my-zsh.sh

# nvm
source /usr/share/nvm/init-nvm.sh

# Preferences
export EDITOR='vim'
export GPG_TTY=$(tty)

# Aliases

## Git
alias gc='git commit -v -S'
alias gc!='git commit -v -S --amend'
alias gcmsg='git commit -S -m'
alias gcn!='git commit -v -S --amend --no-edit'

alias ggc='git gc'
alias ggc!='git gc --prune=now'
alias ggca='git gc --aggressive'
alias ggca!='git gc --aggressive --prune=now'

alias ggrr!='git branch --no-color -r --merged | command grep -v "master\|develop\|dev" | command sed "s/origin\//:/" | xargs -n 1 git push origin'

alias gbbl='git log -p -M --follow --stat -- '

## SO
alias soup='sudo pacman -Syu'
alias socl='sudo pacman -R $(pacman -Qdtq)'
