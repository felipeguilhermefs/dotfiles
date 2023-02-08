export ZSH=~/.oh-my-zsh

# Theme
ZSH_THEME="clean"

# Plugins
plugins=(git ssh-agent kubectl)

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

# Kubernetes
kscale() {
	if [ -z ${1+x} ]
		then
			echo "Service name is needed"
			exit 1
	fi

	if [ -z ${2+x} ]
		then
			echo "Number of replicas is needed"
			exit 1
	fi

	kubectl scale deploy $1 --replicas $2
}

kpod() {
	if [ -z ${1+x} ]
		then
			echo "Pod name is needed"
			exit 1
	fi

	kubectl get pods | grep "$1"
}

ktail() {
	if [ -z ${1+x} ]
		then
			echo "Pod name is needed"
			exit 1
	fi

	if [ -z ${2+x} ]
		then
			kubectl logs $(kpod "$1" | tail -1 | awk '{print $1}')
		else
			kubectl logs --tail $2 $(kpod "$1" | tail -1 | awk '{print $1}')
	fi
}

## Redis
rdelk() {
  if [ -z ${1+x} ]
    then
      echo "Need a pattern"
      exit 1
  fi

  if [ -z ${2+x} ]
    then
      redis-cli KEYS "$1" | xargs redis-cli DEL
    else
      redis-cli -h $2 KEYS "$1" | xargs redis-cli -h $2 DEL
  fi
}

## Maven
alias mvntree="mvn dependency:tree"
alias mvnpristine="mvn dependency:purge-local-repository"

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

