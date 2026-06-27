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
export EDITOR='nvim'
export NVM_DIR="$HOME/.nvm"
export FZF_DEFAULT_OPTS="-m --height 40% --walker-skip .git,node_modules,target --no-mouse --cycle --preview 'bat --style numbers,changes --color=always --line-range=:100 {}'"


# Editor
bindkey -v '^?' backward-delete-char

# Plugins
source ~/.config/zsh/fzf-tab/fzf-tab.plugin.zsh
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# My stuff
source ~/.config/zsh/.alias
source ~/.config/zsh/.functions

# Fuzzy Finder
source <(fzf --zsh)

if type rg &> /dev/null; then
	export FZF_DEFAULT_COMMAND='rg --files'
fi

#SDKMAN
#source "$HOME/.sdkman/bin/sdkman-init.sh"

#zprof

