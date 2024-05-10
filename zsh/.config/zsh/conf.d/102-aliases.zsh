# ls
local ls=exa
alias exa="$ls --icons"
alias {l,ls}="$ls"
alias lsa="$ls -lah"
alias ll="$ls -lh"

# Stack
alias -- -='cd -'
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# Pacman boring commands
alias {update,install}="sudo pacman -Syu"

# to check if vpn works
alias myip="curl icanhazip.com"

# Sanity flags
alias cp="cp -ri"
alias rm="rm -i"
alias df='df -h'
alias makej="make -j \`nproc\`"
alias cat="bat --plain"
alias grep="grep --color=auto"
alias mkdir="mkdir -p"

alias o="xdg-open"
alias path='echo -e ${PATH//:/\\n}'
alias pg="ping 1.0.0.1 -c 5"
alias vi=nvim
alias todo="$EDITOR ~/Documents/Notes/TODO.md"
alias e="$EDITOR"

# default apps
alias -s {pdf,epub,xps,png,jpeg,jpg,gif,svg,webp,bmp,pnm,tiff,txt,json,conf,mp4,mp3,mkv,mov,avi,ts}=open $@
alias -s md=glow
