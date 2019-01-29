# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd beep extendedglob nomatch
unsetopt notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/thomas/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export EDITOR='nvim'

# Aliases
alias e='exit'
alias cls='printf "\033c"'
alias glg='git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all'
alias nv='nvim'

# Vim it!

# Updates editor information when the keymap changes.
function zle-keymap-select() {
	zle reset-prompt
	zle -R
}

# Ensure that the prompt is redrawn when the terminal size changes.
TRAPWINCH() {
	zle && { zle -R; zle reset-prompt }
}

zle -N zle-keymap-select
zle -N edit-command-line
bindkey -v
export KEYTIMEOUT=1

# if mode indicator wasn't setup by theme, define default
if [[ "$MODE_INDICATOR" == "" ]]; then
	MODE_INDICATOR="%{$fg_bold[red]%}<%{$fg[red]%}<<%{$reset_color%}"
fi

function vi_mode_prompt_info() {
	echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
}

# define right prompt, if it wasn't defined by a theme
if [[ "$RPS1" == "" && "$RPROMPT" == "" ]]; then
	RPS1='$(vi_mode_prompt_info)'
fi
