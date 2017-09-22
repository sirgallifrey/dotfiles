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
    sudo pacman -S vim termite zsh htop powerline powerline-fonts

    yaourt -S ttf-font-awesome

    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    git clone https://github.com/zsh-users/antigen.git ~/antigen

    chsh -s /bin/zsh

    vim -c :PlugInstall
}

copy_files
create_files
install_apps
