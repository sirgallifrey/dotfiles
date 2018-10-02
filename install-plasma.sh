#!/bin/bash

RELATIVE_PATH="`dirname \"$0\"`"
DIRNAME="`( cd \"$RELATIVE_PATH\" && pwd )`" 

function copy_files () {
  cp -rv "$DIRNAME/plasma/." ~/
}

#This install script is forked from:

# X-Org
# Also install special acceleration drivers for your graphics card:
# https://wiki.archlinux.org/index.php/xorg
PKG_DESKTOP+="xorg mesa mesa-libgl xorg-drivers "
PKG_DESKTOP+="xf86-video-vesa gstreamer-vaapi libva-mesa-driver "
PKG_DESKTOP+="libva-vdpau-driver libx264 "

# Intel
PKG_DESKTOP+="libva-intel-driver libvdpau-va-gl "

# SDDM
PKG_DESKTOP+="sddm sddm-kcm "

# system
PKG_DESKTOP+="ntp ufw "

# plasma
# for now, iḿ installing everyting on plasma group until I figure out what I don't need. 
PKG_DESKTOP+="plasma kde-applications partitionmanager "

# File manager
PKG_DESKTOP+="purpose kdegraphics-thumbnailers ffmpegthumbs "
PKG_DESKTOP+="kde-cli-tools dolphin-plugins "

# Sound
PKG_DESKTOP+="pulseaudio paprefs "
PKG_DESKTOP+="pavucontrol alsa-utils pulseaudio-zeroconf "
PKG_DESKTOP+="libcanberra libcanberra-pulse "

# Printer
PKG_DESKTOP+="print-manager cups cups-pdf "

# (Fallback) Themes
PKG_DESKTOP+="elementary-icon-theme "
PKG_DESKTOP+="faenza-icon-theme papirus-icon-theme deepin-icon-theme "

# Network
PKG_DESKTOP+="networkmanager plasma-nm dnsmasq avahi nss-mdns "

# Docks
# TODO: decide on the dock... probably latte, but it's buggy
PKG_DESKTOP+="plank latte-dock "

# Install other DE related tools/plugins (also see xfce4-goodies)
PKG_DESKTOP+="dconf-editor xdg-user-dirs "

# ssh
PKG_DESKTOP+="openssh ksshaskpass "

# terminal
#TODO: check if I need vte3
PKG_DESKTOP+="termite "

# apps
PKG_DESKTOP+="chromium firefox-developer-edition "
#TODO: create a Developer install script to install Vscode, rust, node, docker, elixir, etc
PKG_DESKTOP_AUR+="visual-studio-code-bin brave-bin "

# Fonts, Fonts, Fonts ans more Fonts!
PKG_DESKTOP+="ttf-dejavu ttf-ubuntu-font-family noto-fonts ttf-croscore "
PKG_DESKTOP+="ttf-roboto ttf-freefont ttf-hack ttf-inconsolata "
PKG_DESKTOP+="adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts "
PKG_DESKTOP_AUR+="ttf-arabeyes-fonts "

# Install the listed software
sudo pacman -S --needed --noconfirm ${PKG_DESKTOP}
yaourt -S --needed --noconfirm ${PKG_DESKTOP_AUR}

# Try DE first to see if it works
sudo systemctl start sddm.service

# Enable DE if it works and you want to start it at boot
sudo systemctl enable sddm.service

# Enable ntp
sudo systemctl enable ntpd.service
sudo systemctl start ntpd.service

# Enable ufw
sudo systemctl enable ufw.service
sudo systemctl start ufw.service

#enable ahavi
MDSN_CONF="mdns4_minimal [NOTFOUND=return]"
if [[ ! $(cat /etc/nsswitch.conf | grep "${MDSN_CONF}") ]]; then
  sudo sed -r -i "s/(hosts\:.*)( resolve)/\1 ${MDSN_CONF}\2 /" /etc/nsswitch.conf
fi
sudo systemctl enable avahi-daemon.service
sudo systemctl start avahi-daemon.service

# Set color on pacman
sudo sed -i 's/#Color/Color/' /etc/pacman.conf

# hibernate configuration
sudo mkdir -p /etc/systemd/sleep.conf.d
sudo sh -c 'printf "[Sleep]\nHibernateMode=shutdown" > /etc/systemd/sleep.conf.d/hibernatemode.conf'

# Reduce swappiness
sudo sh -c 'printf "vm.swappiness=10" > /etc/sysctl.d/99-sysctl.conf'

# copy config files
copy_files
