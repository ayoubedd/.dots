# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

plug "zap-zsh/supercharge"
plug "agkozak/agkozak-zsh-prompt"
plug "zsh-users/zsh-completions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"
plug "arzzen/calc.plugin.zsh"
plug "jeffreytse/zsh-vi-mode"
plug "wazum/zsh-directory-dot-expansion"

source "${ZDOTDIR}/conf/zsh.zsh"
source "${ZDOTDIR}/conf/env.zsh"
source "${ZDOTDIR}/conf/completion.zsh"
source "${ZDOTDIR}/conf/aliases.zsh"
source "${ZDOTDIR}/conf/bindings.zsh"
source "${ZDOTDIR}/conf/plugins_config.zsh"

# Load and initialise completion system
autoload -Uz compinit && compinit
