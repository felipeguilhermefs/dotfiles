if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=~/.oh-my-zsh

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
plugins=(git gitfast ssh-agent golang zsh-autosuggestions zsh-syntax-highlighting web-search)

source $ZSH/oh-my-zsh.sh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Fuck
eval $(thefuck --alias)

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Fuzzy Finder
source <(fzf --zsh)
export FZF_DEFAULT_OPTS="-m --height 40% --walker-skip .git,node_modules,target --no-mouse --cycle --preview 'bat --style numbers,changes --color=always {} | head -100' "

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
fi

