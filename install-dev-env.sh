#!/bin/bash

# apps
PKG_DESKTOP+="chromium firefox-developer-edition pgadmin3 "
PKG_DESKTOP+="docker docker-compose nodejs-lts-dubnium yarn "
PKG_DESKTOP+="dotnet-host dotnet-sdk dotnet-runtime aspnet-runtime "
PKG_DESKTOP+="rustup go go-tools python "
PKG_DESKTOP_AUR+="visual-studio-code-bin "


# Install the listed software
sudo pacman -S --needed --noconfirm ${PKG_DESKTOP}
yay -S --needed --noconfirm ${PKG_DESKTOP_AUR}

rustup toolchain install stable
rustup default stable

if [[ -d ~/.vim/plugged/YouCompleteMe ]]; then
  cd ~/.vim/plugged/YouCompleteMe
  python ./install.py --ts-completer --go-completer --rust-completer
fi

exec ./fix-npm-permissions.sh

