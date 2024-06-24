#!/bin/bash

set -euo pipefail

function is_cool_coloring() {
  if  [ "$TERM" == "xterm-256color" ] ||
      [ "$TERM" == "xterm-16color" ] ||
      [ "$TERM" == "alacritty" ] ||
      [ "$TERM" == "kitty-xterm" ];
  then
    echo yes
  fi
}

COLORS_ALLOWED=$(is_cool_coloring)

function msg() {
  if [ "$(is_cool_coloring)" ];then
    case $1 in
      INFO)
        echo -en '\033[32m'
        ;;
      ERROR)
        echo -en '\033[31m'
        ;;
      WARNING)
        echo -en '\033[33m'
        ;;
    esac
  fi

  echo -n "[$1] "

  if [ "$(is_cool_coloring)" ];then
    echo -en '\033[0m'
  fi

  echo $2
}

REPO_URL=https://github.com/ayoubedd/.dots
DOTFILES_DIR="$HOME/.dots"
USER=$(whoami)

# Some directories to created
DIRS=(
  Pictures/{Screenshots,Personal,Wallpapers} \
  Videos/{Recordings,Movies} \
  Code \
  .config \
  .local/{bin,share} \
  .cache/zsh/ \
  .ssh/
)

# A list of packages to be installed
PACKAGES=(base-devel zsh rustup go bat mpv pacman-contrib \
  stow gdb nasm alacritty vim eza qt6-wayland qt5-wayland \
  git python python-pip tree docker btop noto-fonts-cjk \
  docker-compose downgrade zip unzip sway playerctl github-cli \
  paru greetd greetd-tuigreet grim wtype slurp glow bear \
  kanshi curl wget axel wl-clipboard swayidle git-delta \
  mako papirus-icon-theme blueman qbittorrent fprintd \
  swaybg waybar wofi brightnessctl zathura zathura-pdf-mupdf \
  swayimg noto-fonts noto-fonts-emoji otf-font-awesome \
  papirus-icon-theme ttf-roboto cliphist xdg-user-dirs \
  xdg-desktop-portal xdg-desktop-portal-wlr xdg-desktop-portal-gtk \
  nm-connection-editor fx thermald lazygit qemu-full \
  xorg-xwayland lynx perl-image-exiftool atool deno \
  catdoc net-tools gnome-keyring seahorse unrar bind \
  zoxide mpd mpc ncmpcpp reflector p7zip nftables \
  sof-firmware wireguard-tools procps-ng \
  yazi ffmpegthumbnailer unarchiver jq poppler fd ripgrep fzf)

AUR_PACKAGES=(catppuccin-cursors-mocha wl-color-picker \
  catppuccin-gtk-theme-mocha neovim-git swaylock-effects-git \
  wofi-emoji-git battop ripdrag-git pam-fprint-grosshack \
  ldm macchina-bin overskride)

if [[ "$USER" == "root" ]]
then
    msg WARNING "its not recommended to run this script as root."
    read -p 'continue as root? [N/y]: ' CHOICE
    case "$CHOICE" in
      y | Y)
        msg WARNING 'continuing as ROOT'
      ;;
      *)
        msg INFO 'exiting, rerun script as a regular user'
        exit 1
      ;;
    esac
fi

# Reset sudo timestamp
sudo -k

msg INFO 'performing system update.'
sudo pacman --needed -Syyu

msg INFO 'installing system packages'
sudo pacman --needed -S ${PACKAGES[@]}

msg INFO 'installing rust toolchain'
rustup default stable

msg INFO 'installing AUR packages'
paru --needed -S ${AUR_PACKAGES[@]}

msg INFO 'cloning .dotfiles repo'
if [ -d "$DOTFILES_DIR" ]
then
    cd "$DOTFILES_DIR"
    if [ ! -d "$DOTFILES_DIR/.git" ]
    then
      msg ERROR "existing \"$DOTFILES_DIR\" is not a repository"
      exit 1
    fi
    git pull
else
    git clone --recursive "$REPO_URL" "$DOTFILES_DIR"
fi

msg INFO 'creating Home directories'
for dir in ${DIRS[@]}
do
  msg INFO "creating => \"~/$dir/\""
  mkdir -p "$HOME/$dir/"
done

cd "$DOTFILES_DIR"

msg INFO 'stowing your config files'
stow -vSt ~/ $(cat ./stowables.txt)

msg INFO 'updating xdg-user directories'
xdg-user-dirs-update --force

source "$HOME/.zshenv"

# msg INFO 'building bat themes cache'
# bat cache --build

msg INFO 'creating symbolic links to default mime types'
ln -sf ~/.config/mimeapps.list ~/.local/share/applications/mimeapps.list
ln -sf ~/.config/mimeapps.list ~/.local/share/applications/defaults.list

msg INFO 'copying wallpapers'
cp ./media/Wallpapers/{wallpaper.jpg,lockscreen.jpg} ~/Pictures/Wallpapers/

msg INFO 'copying configs/scripts to system'
sudo cp ./scripts/sway-wrapper /usr/local/bin/sway-wrapper
sudo chmod +x /usr/local/bin/sway-wrapper

sudo cp ./confs/greetd/greetd-config.toml /etc/greetd/config.toml
sudo cp ./confs/tlp/tlp.conf /etc/tlp.conf
sudo cp ./confs/udev/*.rules /etc/udev/rules.d/
sudo cp ./confs/pam/* /etc/pam.d/
sudo cp ./confs/sudoers.d/* /etc/sudoers.d/
sudo cp ./confs/pulse/* /etc/pulse/
sudo cp ./confs/bluetooth/* /etc/bluetooth/
sudo cp ./confs/nft/nftables.conf /etc/nftables.conf

msg INFO 'enabling system services'
sudo systemctl enable --now greetd.service
sudo systemctl enable --now bluetooth.service
sudo systemctl enable --now thermald.service
sudo systemctl enable --now fprintd.service
sudo systemctl enable --now nftables.service
sudo systemctl enable --now ldm.service
sudo systemctl enable --now tlp.service
systemctl --user start gcr-ssh-agent.socket
systemctl --user enable --now gnome-keyring-daemon.service

msg INFO 'adding user to various groups'
sudo usermod -aG video,docker $USER

msg INFO 'generating mirrors'
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
sudo reflector --country France,Germany,Spain,Belgium,Portugal \
  --age 12 --fastest 10 --protocol https \
  --sort rate --save /etc/pacman.d/mirrorlist \
  --verbose

msg INFO 'done'

