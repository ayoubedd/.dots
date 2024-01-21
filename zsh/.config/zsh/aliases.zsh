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
alias lsa="exa --icons -lah"
alias ll="exa --icons -lh"
alias {l,ls}="exa --icons "

# fzf
alias fzf="fzf --preview 'bat --color=always {}' --preview-window '~3'"

# Tools
alias makej="make -j `nproc`"
alias cat=bat
alias grep="grep --color=auto"
