export ZSH=~/.oh-my-zsh

# Theme
ZSH_THEME="af-magic"

# Plugins
plugins=(git ssh-agent kubectl golang)

source $ZSH/oh-my-zsh.sh
source <(kubectl completion zsh)

# Preferences
export EDITOR='vim'
export SYSTEM_VERSION_COMPAT=1
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"

# Git
alias ggc='git gc'
alias ggc!='git gc --prune=now'
alias ggca='git gc --aggressive'
alias ggca!='git gc --aggressive --prune=now'
alias ggrr!='git branch --no-color -r --merged | command grep -v "master\|develop\|dev" | command sed "s/origin\//:/" | xargs -n 1 git push origin'
alias gbbl='git log -p -M --follow --stat -- '
alias gprev='git checkout -'

## Redis
rdelk() {
  if [ -z ${1+x} ]
    then
      echo "Need a pattern"
      exit 1
  fi

  if [ -z ${2+x} ]
    then
      redis-cli KEYS "$1" | xargs redis-cli UNLINK
    else
      redis-cli -h $2 KEYS "$1" | xargs redis-cli -h $2 UNLINK
  fi
}

## Misc
alias dw="cd $HOME/Downloads"
alias proj="cd $HOME/Projects"

kill-port() {
	if [ -z ${1+x} ]
		then
			echo "Port is unset"
		else
			PORT=${1}
			lsof -Pn | grep ":$PORT" | awk '{print $2}' | xargs kill -9
			echo "The service running on port $PORT was killed!"
	fi
}

