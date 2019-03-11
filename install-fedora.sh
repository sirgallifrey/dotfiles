RELATIVE_PATH="`dirname \"$0\"`"
DIRNAME="`( cd \"$RELATIVE_PATH\" && pwd )`" 

function copy_files () {
  cp -rv "$DIRNAME/src/." ~/
}

function create_files () {
  if [ ! -r ~/.zsh_custom  ]; then
    touch ~/.zsh_custom
  fi
}

PKG_DESKTOP+="vim zsh htop powerline powerline-fonts "

function install_apps () {
  sudo dnf install ${PKG_DESKTOP}

  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  git clone https://github.com/zsh-users/antigen.git ~/antigen

  chsh -s /bin/zsh

  #hae to find a better way to do this
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
