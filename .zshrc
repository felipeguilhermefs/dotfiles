# Git
alias ggc='git gc'
alias ggc!='git gc --prune=now'
alias ggca='git gc --aggressive'
alias ggca!='git gc --aggressive --prune=now'
alias ggrr!='git branch --no-color -r --merged | command grep -v "master\|develop\|dev" | command sed "s/origin\//:/" | xargs -n 1 git push origin'
alias gbbl='git log -p -M --follow --stat -- '
alias gprev='git checkout -'

# Editor
export EDITOR='nvim'
alias vim="$EDITOR"
alias vi="$EDITOR"
alias code="$EDITOR"

alias ls="lsd"

### Vim Motions to Terminal
bindkey -v '^?' backward-delete-char

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

# Fuzzy Finder
source <(fzf --zsh)
export FZF_DEFAULT_OPTS="-m --height 40% --walker-skip .git,node_modules,target --no-mouse --cycle --preview 'bat --style numbers,changes --color=always {} | head -100' "

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
fi

# NVM
export NVM_DIR="$HOME/.nvm"

nvm() {
	unset -f nvm
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
	nvm "$@"
}
