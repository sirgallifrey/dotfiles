RELATIVE_PATH="`dirname \"$0\"`"
DIRNAME="`( cd \"$RELATIVE_PATH\" && pwd )`" 

function copy_files () {
  cp -rv "$DIRNAME/src/." ~/
}

function create_files () {
  if [ ! -r ~/.zsh_functions ]; then
    touch ~/.zsh_functions
  fi

  if [ ! -r ~/.zsh_custom  ]; then
    touch ~/.zsh_custom
  fi

  if [ ! -r ~/.zsh_aliases ]; then
    touch ~/.zsh_aliases
  fi
}

function install_apps () {
  sudo pacman -S vim termite zsh htop powerline powerline-fonts nodejs docker docker-compose

  yaourt -S ttf-font-awesome yarn visual-studio-code-bin

  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  git clone https://github.com/zsh-users/antigen.git ~/antigen

  chsh -s /bin/zsh

  vim -c :PlugInstall
}

function create_directories () {
  mkdir -p ~/projects
  mkdir -p ~/bin
}

copy_files
create_directories
create_files
install_apps
