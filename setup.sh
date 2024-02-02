#!/bin/zsh

set -e

REPO_URL=https://github.com/ayoubedd/.dotfiles
DOTFILES_DIR="$HOME/.dotfiles"
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

# A list of packges to be installed
PACKAGES=(base-devel zsh rustup go bat mpv pacman-contrib \
  stow gdb nasm lf alacritty vim eza qt6-wayland qt5-wayland \
  git python python-pip tree docker btop noto-fonts-cjk \
  docker-compose downgrade zip unzip sway playerctl github-cli \
  paru greetd greetd-tuigreet grim wtype slurp glow bear \
  kanshi curl wget axel wl-clipboard swayidle git-delta \
  mako papirus-icon-theme blueman qbittorrent fprintd \
  swaybg waybar wofi brightnessctl zathura zathura-pdf-mupdf \
  swayimg noto-fonts noto-fonts-emoji otf-font-awesome \
  papirus-icon-theme ttf-roboto cliphist xdg-user-dirs \
  xdg-desktop-portal xdg-desktop-portal-wlr procps-ng \
  nm-connection-editor fx thermald lazygit qemu-full \
  xorg-xwayland exiftool lynx perl-image-exiftool atool \
  catdoc net-tools gnome-keyring ufw seahorse unrar)

AUR_PACKAGES=(catppuccin-cursors-mocha wl-color-picker \
  catppuccin-gtk-theme-mocha neovim-git swaylock-effects-git \
  wofi-emoji-git battop ripdrag-git pam-fprint-grosshack \
  ldm)

if [[ "$USER" == "root" ]]
then
    echo "[WARNING] Its not recommended to run this script as root."
    exit 1
fi

echo '[INFO] Performing system update.'
sudo pacman --needed -Syyu

echo '[INFO] Installing system packages.'
sudo pacman --needed -S ${PACKAGES[@]}

echo '[INFO] Installing rust toolchain'
rustup default stable

echo '[INFO] Insalling AUR packages.'
paru --needed -S ${AUR_PACKAGES[@]}

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
    git clone --recursive "$REPO_URL" "$DOTFILES_DIR"
fi

echo '[INFO] Creating Home directories.'
for dir in ${DIRS[@]}
do
  echo "[INFO] Creating => \"~/$dir/\""
  mkdir -p "$HOME/$dir/"
done

cd "$DOTFILES_DIR"

echo '[INFO] Stowing your config files.'
stow -vSt ~/ $(cat ./stowables.txt)

echo '[INFO] Updating xdg-user directories.'
xdg-user-dirs-update

echo '[INFO] Installing volta and nodejs.'
curl https://get.volta.sh | bash
source ~/.profile
volta install node

echo '[INFO] Building bat themes cache'
bat cache --build

echo '[INFO] Creating symbolic links to default mime types.'
ln -sf ~/.config/mimeapps.list ~/.local/share/applications/mimeapps.list
ln -sf ~/.config/mimeapps.list ~/.local/share/applications/defaults.list

echo '[INFO] Copying wallpapers.'
cp ./media/Wallpapers/{wallpaper.jpg,lockscreen.jpg} ~/Pictures/Wallpapers/

echo '[INFO] Enabling system services.'
sudo systemctl enable --now greetd.service
sudo systemctl enable --now bluetooth.service
sudo systemctl enable --now thermald.service
sudo systemctl enable --now fprintd.service
sudo systemctl enable --now ufw.service
systemctl enable --now --user gnome-keyring-daemon.service

echo '[INFO] Configuring ufw.'
sudo ufw default deny
sudo ufw enable
sudo ufw reload

echo '[INFO] Copying configs/scripts to system.'
sudo cp ./scripts/sway-wrapper /usr/local/bin/sway-wrapper
sudo cp ./confs/greetd-config.toml /etc/greetd/config.toml
sudo cp ./confs/udev/*.rules /etc/udev/rules.d/
sudo cp ./confs/sudoers.d/* /etc/sudoers.d/
sudo cp ./confs/pulse/* /etc/pulse/

echo '[INFO] Adding user to various gropus.'
sudo usermod -aG video,docker $USER

echo '[INFO] Done.'

