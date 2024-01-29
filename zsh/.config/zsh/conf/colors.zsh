
bindkey -M menuselect '^[[Z' reverse-menu-complete

zstyle ":completion:*:default" list-colors ${(s.:.)LS_COLORS} "ma=40;92;153;1"
