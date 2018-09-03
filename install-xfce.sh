#!/bin/bash

RELATIVE_PATH="`dirname \"$0\"`"
DIRNAME="`( cd \"$RELATIVE_PATH\" && pwd )`" 

function copy_files () {
  cp -rv "$DIRNAME/xfce4/." ~/
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

# Lightdm
PKG_DESKTOP+="lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings "
PKG_DESKTOP+="accountsservice light-locker "

# xfce4
# Not using xfce4-terminal, termite is a simpler solution 
PKG_DESKTOP+="exo garcon gtk-xfce-engine xfce4-appfinder xfce4-power-manager "
PKG_DESKTOP+="xfce4-settings xfconf xfdesktop xfwm4 xfcwm4-themes  xfce4-panel "
# Using the git version until 4.13 comes out
PKG_DESKTOP_AUR+="xfce4-session-git mugshot "

# File manager
PKG_DESKTOP+="thunar thunar-volman thunar-archive-plugin tumbler file-roller "
PKG_DESKTOP+="catfish mlocate gvfs udisks2 thunar-media-tags-plugin "
PKG_DESKTOP+="ffmpegthumbnailer freetype2 libgsf libopenraw poppler-glib "

# Sound
PKG_DESKTOP+="pulseaudio paprefs "
PKG_DESKTOP+="pavucontrol alsa-utils pulseaudio-zeroconf "
PKG_DESKTOP+="libcanberra libcanberra-pulse "

# (Fallback) Themes
PKG_DESKTOP+="arc-gtk-theme arc-icon-theme gnome-themes-standard "
PKG_DESKTOP+="gtk-engine-murrine elementary-icon-theme "
PKG_DESKTOP+="faenza-icon-theme papirus-icon-theme deepn-icon-theme "
PKG_DESKTOP+="archlinux-wallpaper "

# Network
PKG_DESKTOP+="networkmanager network-manager-applet dnsmasq avahi nss-mdns "

# Plank dock
PKG_DESKTOP+="plank "

# Whiskermenu
PKG_DESKTOP+="xfce4-whiskermenu-plugin alacarte "

# Xfce4 panel plugins
PKG_DESKTOP+="nm-connection-editor xfce4-xkb-plugin xfce4-cpugraph-plugin "
PKG_DESKTOP+="xfce4-genmon-plugin xfce4-sensors-plugin xfce4-notes-plugin "

# Install other DE related tools/plugins (also see xfce4-goodies)
PKG_DESKTOP+="dconf-editor xdg-user-dirs xfce4-notifyd "

# ssh
PKG_DESKTOP+="openssh x11-ssh-askpass "

# terminal
#TODO: check if I need vte3
PKG_DESKTOP+="termite "

# utilities
PKG_DESKTOP_AUR+="ksuperkey "

# apps
PKG_DESKTOP+="chromium mousepad ristretto xfce4-artwork xfce4-taskmanager "
#TODO: create a Developer install script to install Vscode, rust, node, docker, etc
PKG_DESKTOP_AUR+="visual-studio-code-bin "

# xfce4 plugins
PKG_DESKTOP+="xfce4-battery-plugin xfce4-datetime-plugin xfce4-dict "
PKG_DESKTOP+="xfce4-genmon-plugin xfce4-mount-plugin xfce4-mpc-plugin "
PKG_DESKTOP+="xfce4-notifyd xfce4-pulseaudio-plugin xfce4-screenshooter "
PKG_DESKTOP+="xfce4-time-out-plugin xfce4-timer-plugin xfce4-xkb-plugin "

# Fonts, Fonts, Fonts ans more Fonts!
PKG_DESKTOP+="ttf-dejavu ttf-ubuntu-font-family noto-fonts ttf-croscore "
PKG_DESKTOP+="ttf-roboto ttf-freefont ttf-hack ttf-inconsolata "
PKG_DESKTOP+="adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts "
PKG_DESKTOP_AUR+="ttf-arabeyes-fonts "

# Install the listed software
sudo pacman -S --needed --noconfirm ${PKG_DESKTOP}
yaourt -S --needed --noconfirm ${PKG_DESKTOP_AUR}

# Config lightdm to use gtk-greeter
GREETER_LFROM="# greeter-session = Session to load for greeter"
GREETER_LTO="greeter-session = lightdm-gtk-greeter"
sudo sed -i "s/${GREETER_LFROM}/${GREETER_LTO}/" /etc/lightdm/lightdm.conf

# Try DE first to see if it works
sudo systemctl start lightdm.service

# Enable DE if it works and you want to start it at boot
sudo systemctl enable lightdm.service

# Set color on pacman
sudo sed -i 's/#Color/Color/' /etc/pacman.conf

# set light-locker
xfconf-query -c xfce4-session -p /general/LockCommand -s "light-locker-command --lock" --create -t string

# copy config files
copy_files
