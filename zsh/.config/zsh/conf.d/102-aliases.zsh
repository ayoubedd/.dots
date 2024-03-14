# default apps
alias -s {pdf,epub,xps}=zathura
alias -s {png,jpeg,jpg,gif,svg,webp,bmp,pnm,tiff}=swayimg
alias -s {txt,json,conf}=bat
alias -s {mp4,mp3,mkv,mov,avi,ts}=mpv
alias -s md=glow

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

# Pacman boring commands
alias pac="pacman"
alias search="pacman -Ss"
alias {update, install}="sudo pacman -Syu"

# to check if vpn works
alias myip="curl icanhazip.com"

# Sanity flags
alias cp="cp -i"
alias rm="rm -i"
alias df='df -h'

# Ping
alias pg="ping google.com -c 5"
alias copy="wl-copy"
