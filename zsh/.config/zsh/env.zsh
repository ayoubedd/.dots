
# Bat theme
export BAT_THEME="Catppuccin-mocha"

# SSH Agent socket
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/gcr/ssh"

# Cargo bin path
export PATH="$HOME/.cargo/bin:$PATH"

# Include volta in path
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$HOME/.local/bin:$PATH"

# Go path
export GOPATH="$HOME/.go"

# ghcup
export PATH="$HOME/.ghcup/bin:$PATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export VISUAL='vim'
  export EDITOR='vim'
else
  export VISUAL='lvim'
  export EDITOR='lvim'
fi

