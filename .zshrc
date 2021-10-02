export ZSH=~/.oh-my-zsh

# Theme
ZSH_THEME="clean"

# Plugins
plugins=(git ssh-agent)

source $ZSH/oh-my-zsh.sh
source <(kubectl completion zsh)

# Preferences
export EDITOR='vim'
export SYSTEM_VERSION_COMPAT=1
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"

# Aliases
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gcmsg='git commit -m'
alias gcn!='git commit -v --amend --no-edit'
alias ggc='git gc'
alias ggc!='git gc --prune=now'
alias ggca='git gc --aggressive'
alias ggca!='git gc --aggressive --prune=now'
alias ggrr!='git branch --no-color -r --merged | command grep -v "master\|develop\|dev" | command sed "s/origin\//:/" | xargs -n 1 git push origin'
alias gbbl='git log -p -M --follow --stat -- '

# Go
export GOPATH="$HOME/go"
export GO_HOME="/usr/local/go"
export PATH="$PATH:$GO_HOME/bin:$GOPATH/bin"

# pyenv
export PIPENV_VENV_IN_PROJECT=1
export PIPENV_IGNORE_VIRTUALENV=1
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

