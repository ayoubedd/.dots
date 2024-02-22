# default apps
alias -s {pdf,epub,xps}=zathura
alias -s {png,jpeg,jpg,gif,svg,webp,bmp,pnm,tiff}=swayimg
alias -s {txt,json,conf}=bat
alias -s {mp4,mp3,mkv,mov,avi,ts}=mpv
alias -s md=glow

# git
alias gst="git status"
alias gp="git push"
alias gl="git log"
alias glo="git log --oneline"
alias gcm="git commit -m"
alias gdf="git diff"
alias gad="git add"
alias gcl="git clone"

# ls
alias exa="exa --icons"
alias {l,ls}="exa"
alias lsa="exa -lah"
alias ll="exa -lh"

# Tools
alias makej="make -j \`nproc\`"
alias cat="bat --plain"
alias grep="grep --color=auto"
alias mkdir="mkdir -p"
alias cp="cp -r"

# Stack
alias -- -='cd -'
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# Fallbacks for vim
function vi() {
  if [ $+commands[nvim] ]; then
    nvim
  elif [ $+commands[vim] ]; then
    vim
  elif [ $+commands[vi] ]; then
    vi
  fi
}

# Pacman boring commands
alias pac="pacman"
alias search="pac -Ss"
alias update="sudo pac -Syu"
alias install="sudo pac -S"

# Ping
alias pg="ping google.com -c 5"
