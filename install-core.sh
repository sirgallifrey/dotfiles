#!/bin/bash

RELATIVE_PATH="`dirname \"$0\"`"
DIRNAME="`( cd \"$RELATIVE_PATH\" && pwd )`" 

function copy_files () {
  cp -r "$DIRNAME/src/." ~/

  if [[ ! $(grep "source ~/.custom-profile" ~/.profile) ]]; then
    echo "source ~/.custom-profile" >> ~/.profile
  fi
}

function create_files () {
  if [ ! -r ~/.zsh_custom  ]; then
    touch ~/.zsh_custom
  fi
}

PKG_DESKTOP+="vim zsh htop powerline powerline-fonts yay"

function install_apps () {
  sudo pacman -S --needed --noconfirm ${PKG_DESKTOP}

  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  git clone https://github.com/zsh-users/antigen.git ~/antigen

  chsh -s /bin/zsh

  vim -c ":PlugInstall | qa"

  $DIRNAME/install-wallpapers.sh
}

function create_directories () {
  mkdir -p ~/projects
  mkdir -p ~/bin
}

function apply_configuration () {
  if [[ -f /etc/lightdm/lightdm.conf ]]; then
    GREETER_SCRIPT_CONF="greeter-setup-script=xset b off"

    if [[ ! $(cat /etc/lightdm/lightdm.conf | grep -v "^#" | grep greeter-setup-script) ]]; then
      sudo sed -i "/^\[Seat\:\*\]/a${GREETER_SCRIPT_CONF}" /etc/lightdm/lightdm.conf
    fi

  fi

  # Set color on pacman
  sudo sed -i 's/#Color/Color/' /etc/pacman.conf

  # make swap writes less frequent
  sudo sh -c 'printf "vm.swappiness=10" > /etc/sysctl.d/8833-sysctl.conf'

  if [[ -f /etc/lightdm/slick-greeter.conf ]]; then
    BACKGROUND_LIGHTDM="background=\/usr\/share\/sirgallfrey-wallpapers\/yuriy-chemerys-1428481-unsplash.jpg"

    sudo sed -i -e "s/background=.*$/$BACKGROUND_LIGHTDM/" /etc/lightdm/slick-greeter.conf
  fi
}

copy_files
create_directories
create_files
install_apps
apply_configuration

