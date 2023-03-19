#!/bin/bash

REPO_URL=https://github.com/ayoubedd/.dotfiles
DOTFILES_DIR="$HOME/.dotfiles"
USER=$(whoami)
PACKAGES=(base-devel zsh rustup go stow gdb nasm ncdu lf alacritty vim git python python-pip tree tmux docker docker-compose downgrade zip unzip sway swaybg waybar rofi light)

if [ "$USER" == "root" ]
then
    echo "[WARNING] Its not recommended to run this script as root."
    sleep 5
fi

echo [INFO] Installing system packages.
sudo pacman --needed -Syuu ${PACKAGES[@]} <<< Y

echo [INFO] Cloning .dotfiles repo.
git clone --recurse-submodules "$REPO_URL" "$DOTFILES_DIR"

if [ "$?" != "0" ]
then
    exit 1
fi

cd ~/.dotfiles

echo [INFO] Stowing your config files.
stow -vSt ~/test $(find . -maxdepth 1 -type d -not -path './.git' -not -path . | tr -d './')

echo [INFO] Done.
