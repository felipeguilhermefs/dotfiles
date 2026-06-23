#zmodload zsh/zprof

# Disable brew telemetry export
export HOMEBREW_NO_ANALYTICS=1

# Shell history
setopt SHARE_HISTORY HIST_IGNORE_DUPS
SAVEHIST=20000
HISTFILE=~/.zsh_history

# Pure
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure


# Cache completions
autoload -Uz bashcompinit; bashcompinit 
autoload -Uz compinit
if [[ -n $HOME/.zcompdump(#qNmh-24) ]]; then
	compinit -C
else
	compinit
fi

export K9S_SKIN="nightfox"


# Editor
export EDITOR='nvim'
alias vi="$EDITOR"
alias vim="$EDITOR"
alias code="$EDITOR"
bindkey -v '^?' backward-delete-char

# Remaps
alias ls="lsd"

# Bat
alias batn='bat --style=plain'

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

# Plugins
source ~/.config/zsh/fzf-tab/fzf-tab.plugin.zsh
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# My stuff
source ~/.config/zsh/.alias

# Fuzzy Finder
source <(fzf --zsh)
export FZF_DEFAULT_OPTS="-m --height 40% --walker-skip .git,node_modules,target --no-mouse --cycle --preview 'bat --style numbers,changes --color=always {} | head -100' "

if type rg &> /dev/null; then
	export FZF_DEFAULT_COMMAND='rg --files'
fi

#SDKMAN
#source "$HOME/.sdkman/bin/sdkman-init.sh"

# KUBECTL
kubectl() {
	command kubectl "$@"
	local ret=$?
	if [[ -z $KUBECTL_COMPLETE ]]; then
		source <(command kubectl completion zsh)
		KUBECTL_COMPLETE=1
	fi
	return $ret
}

# NVM
export NVM_DIR="$HOME/.nvm"
nvm() {
	unset -f nvm
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
	nvm "$@"
}

#zprof

