# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "arzzen/calc.plugin.zsh"
plug "ael-code/zsh-colored-man-pages"
plug "jeffreytse/zsh-vi-mode"

for CONFIG_FILE_NAME in $(ls "${XDG_DATA_HOME:-$HOME}/.config/zsh/")
do
  plug "${XDG_DATA_HOME:-$HOME}/.config/zsh/${CONFIG_FILE_NAME}"
done

# Load and initialise completion system
autoload -Uz compinit
compinit
