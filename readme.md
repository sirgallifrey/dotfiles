# install deps:

pacman -S termite libqalculate xcompmgr ffmpeg chromium scrot playerctl sysstat          
yaourt -S ttf-font-awesome

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone https://github.com/zsh-users/antigen.git ~/antigen

open vim and type `:PlugInstall`

read .i3/config for more deps
