# ZSH history file
export HISTFILE="${XDG_DATA_HOME:-$HOME}/.cache/zsh/history"

autoload -z edit-command-line
zle -N edit-command-line

# edit command in editor
bindkey -M vicmd E edit-command-line

export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

