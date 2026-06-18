#zmodload zsh/zprof

# Pure
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure


# Cache completions
autoload -Uz compinit
if [[ -n $HOME/.zcompdump(#qNmh-24) ]]; then
	compinit -C
else
	compinit
fi

export K9S_SKIN="nightfox"

# Git
alias g='git'
alias ga='git add'
alias gapa='git add --patch'
alias gau='git add --update'
alias gb='git branch'
alias gba='git branch --all'
alias gbd='git branch --delete'
alias gbD='git branch --delete --force'
alias gbda='git branch --no-color --merged | command grep -vE "^([+*]|\s*(main|main-fff)\s*$)" | command xargs git branch --delete 2>/dev/null'
alias gbm='git branch --move'
alias gbr='git branch --remote'
alias gc='git commit --verbose'
alias gc!='git commit --verbose --amend'
alias gcb='git checkout -b'
alias gcm='git checkout main'
alias gcmsg='git commit --message'
alias gcn!='git commit --verbose --no-edit --amend'
alias gco='git checkout'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gd='git diff'
alias gdca='git diff --cached'
alias gfa='git fetch --all --tags --prune'
alias ggc='git gc'
alias ggc!='git gc --prune=now'
alias ggca='git gc --aggressive'
alias ggca!='git gc --aggressive --prune=now'
alias ggrr!='git branch --no-color -r --merged | command grep -v "master\|main\|main-fff" | command sed "s/origin\//:/" | xargs -n 1 git push origin'
alias gl='git pull'
alias glg='git log --stat'
alias glo='git log --oneline --decorate'
alias glp='git log --stat --patch'
alias glt='git log --oneline --decorate --graph'
alias gm='git merge'
alias gp='git push origin --verbose'
alias gp!='git push origin --force --verbose'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase --interactive'
alias grbm='git rebase main'
alias grbs='git rebase --skip'
alias gst='git status'
alias gsta='git stash push'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'

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

# Fuzzy Finder
source <(fzf --zsh)
export FZF_DEFAULT_OPTS="-m --height 40% --walker-skip .git,node_modules,target --no-mouse --cycle --preview 'bat --style numbers,changes --color=always {} | head -100' "

if type rg &> /dev/null; then
	export FZF_DEFAULT_COMMAND='rg --files'
fi

#SDKMAN
source "$HOME/.sdkman/bin/sdkman-init.sh"

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

