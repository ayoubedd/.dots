#!/bin/zsh

set -e

REPO_URL=https://github.com/ayoubedd/.dotfiles
DOTFILES_DIR="$HOME/.dotfiles"
USER=$(whoami)

# Some directories to created
DIRS=(Downloads Pictures/{Screenshots,Personal} \
  Videos/{Recordings,Movies} Documents \
  code/{ayoub,orbit})

# A list of packges to be installed
PACKAGES=(base-devel zsh rustup go bat \
  stow gdb nasm lf alacritty vim exa \
  git python python-pip tree tmux docker btop \
  docker-compose downgrade zip unzip sway playerctl \
  paru greetd greetd-tuigreet grim wtype slurp glow \
  kanshi curl wget axel wl-clipboard swayidle git-delta \
  mako papirus-icon-theme blueman spotifyd \
  swaybg waybar wofi brightnessctl zathura zathura-pdf-mupdf \
  swayimg noto-fonts noto-fonts-emoji otf-font-awesome \
  papirus-icon-theme ttf-roboto cliphist \
  xdg-desktop-portal xdg-desktop-portal-wlr procps-ng)

AUR_PACKAGES=(catppuccin-cursors-mocha wl-color-picker \
  catppuccin-gtk-theme-mocha neovim-git swaylock-effects-git \
  wofi-emoji-git battop spotify-tui)

if [[ "$USER" == "root" ]]
then
    echo "[WARNING] Its not recommended to run this script as root."
    sleep 5
fi

echo '[INFO] Creating home directories.'
for dir in ${DIRS[@]}
do
  echo "[INFO] Creating => \"~/$dir/\""
  mkdir -p "$HOME/$dir/"
done

echo '[INFO] Installing system packages.'
sudo pacman --needed -Sy ${PACKAGES[@]}

echo '[INFO] Cloning .dotfiles repo.'
if [ -d "$DOTFILES_DIR" ]
then
    cd "$DOTFILES_DIR"
    if [ ! -d "$DOTFILES_DIR/.git" ]
    then
      echo "[ERROR] existing \"$DOTFILES_DIR\" is not a repositry."
      exit 1
    fi
    git pull
else
    git clone --recurse-submodules "$REPO_URL" "$DOTFILES_DIR"
fi

cd "$DOTFILES_DIR"

echo '[INFO] Stowing your config files.'
stow -vSt ~/ $(find . -maxdepth 1 -type d -not -path './.git' -not -path . | tr -d './')

# echo '[INFO] Symlinking zsh config'
# setopt EXTENDED_GLOB
# for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
#   ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
# done

echo '[INFO] Insalling AUR packages.'
paru --needed -S ${AUR_PACKAGES[@]}

echo '[INFO] Done.'
