#!/bin/bash

RELATIVE_PATH="`dirname \"$0\"`"
DIRNAME="`( cd \"$RELATIVE_PATH\" && pwd )`" 

function copy_files () {
  cp -rv "$DIRNAME/src/." ~/

  if [[ ! $(grep "source ~/.custom-profile" ~/.profile) ]]; then
    echo "source ~/.custom-profile" >> ~/.profile
  fi
}

function create_files () {
  if [ ! -r ~/.zsh_custom  ]; then
    touch ~/.zsh_custom
  fi
}

# ssh
PKG_DESKTOP+="openssh "

# Terminal goodies
PKG_DESKTOP+="vim zsh htop powerline powerline-fonts "

function install_apps () {
  sudo pacman -S --needed --noconfirm ${PKG_DESKTOP}

  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  git clone https://github.com/zsh-users/antigen.git ~/antigen

  chsh -s /bin/zsh

  vim -c ":PlugInstall | qa"
}

function create_directories () {
  mkdir -p ~/projects
  mkdir -p ~/bin
}

copy_files
create_directories
create_files
install_apps

#export QT_QPA_PLATFORMTHEME="qt5ct"
#export EDITOR=/usr/bin/nano
#export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
