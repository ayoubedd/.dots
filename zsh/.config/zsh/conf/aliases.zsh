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

# Extract files
function extract { 
  if [ -f $1 ] ; then 
    case $1 in 
      *.tar.bz2)   tar xjf $1     ;; 
      *.tar.gz)    tar xzf $1     ;; 
      *.bz2)       bunzip2 $1     ;; 
      *.rar)       unrar e $1     ;; 
      *.gz)        gunzip $1      ;; 
      *.tar)       tar xf $1      ;; 
      *.tbz2)      tar xjf $1     ;; 
      *.tgz)       tar xzf $1     ;; 
      *.zip)       unzip $1       ;; 
      *.Z)         uncompress $1  ;; 
      *.7z)        7z x $1        ;; 
      *)     echo "'$1' cannot be extracted via extract()" ;; 
       esac 
   else 
       echo "'$1' is not a valid file" 
   fi 
}

function fman {
  man -k - | fzf | cut -d ' ' -f 1 | xargs man
}

function fopen {
  local FILE=$(fzf --preview "bat --color=always --style=numbers --line-range=:500 {}")
  if [ ! -f "$FILE" ];then
    exit 1
  fi

  xdg-open "$FILE"
}
