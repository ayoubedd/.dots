zmodload zsh/complist

# edit command in editor
autoload -z edit-command-line
zle -N edit-command-line
bindkey -M vicmd '^e' edit-command-line

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect '^[[Z' reverse-menu-complete

# Insert sudo before command
function insert_sudo() {
  zle beginning-of-line;
  zle -U "sudo "
}
zle -N insert-sudo insert_sudo
bindkey "^x" insert-sudo

bindkey -M menuselect '?' history-incremental-search-forward
bindkey -M menuselect '/' history-incremental-search-backward
