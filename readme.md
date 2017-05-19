# install deps:

pacman -S termite libqalculate compton ffmpeg chromium scrot playerctl sysstat rofi dunst network-manager-applet          
yaourt -S ttf-font-awesome pasystray-gtk3-standalone 

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone https://github.com/zsh-users/antigen.git ~/antigen

open vim and type `:PlugInstall`

read .i3/config for more deps
