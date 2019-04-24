#!/bin/bash

# apps
PKG_DESKTOP+="chromium firefox-developer-edition pgadmin3 "
PKG_DESKTOP+="docker docker-compose yarn "
PKG_DESKTOP+="dotnet-host dotnet-sdk dotnet-runtime aspnet-runtime "
PKG_DESKTOP+="rustup "
PKG_DESKTOP_AUR+="visual-studio-code-bin nvm "

# Install the listed software
sudo pacman -S --needed --noconfirm ${PKG_DESKTOP}
yay -S --needed --noconfirm ${PKG_DESKTOP_AUR}

rustup toolchain install stable
rustup default stable

if [[ -d ~/.vim/plugged/YouCompleteMe ]]; then
  cd ~/.vim/plugged/YouCompleteMe
  python ./install.py --ts-completer --go-completer --rust-completer
fi

# use nvm stuff
[[ -f /usr/share/nvm/init-nvm.sh ]] && source /usr/share/nvm/init-nvm.sh

nvm install 10
nvm use 10

echo "Creating npm global dir for $(whoami)"
mkdir -p ~/npm/bin
npm config set prefix "$HOME/npm"


