export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export HISTFILE="$XDG_CACHE_HOME/zsh/history"
export HISTSIZE=50000     # Maximum events for internal history
export SAVEHIST=50000     # Maximum events in history file

# Bat theme
export BAT_THEME="Catppuccin-mocha"

# SSH Agent socket
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gcr/ssh"

# Include volta in path
export VOLTA_HOME="$XDG_DATA_HOME/volta"

# Go path
export GOPATH="$XDG_DATA_HOME/go"
export GOCACHE="$XDG_CACHE_HOME/go"
export GOBIN="$GOPATH/bin"

# Cargo path
export CARGO_HOME="$XDG_DATA_HOME/cargo"

export PATH="$GOBIN:$CARGO_HOME/bin:$VOLTA_HOME/bin:$PATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export VISUAL='vim'
  export EDITOR='vim'
else
  export VISUAL='lvim'
  export EDITOR='lvim'
fi

export NODE_REPL_HISTORY="$XDG_CACHE_HOME/node_repl_history"
export DENO_REPL_HISTORY="$XDG_CACHE_HOME/deno_repl_history"
export DENO_DIR="$XDG_CACHE_HOME/deno/"
