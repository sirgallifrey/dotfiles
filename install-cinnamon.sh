#!/bin/bash

# Lets update arch frist
sudo pacman -Syu --noconfirm

# Xorg and intel drivers
PKG_DESKTOP+="xorg mesa lib32-mesa mesa-libgl xorg-drivers "
PKG_DESKTOP+="libx264 "
PKG_DESKTOP+="vulkan-intel "

# Display manager
PKG_DESKTOP+="lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings "

# system
PKG_DESKTOP+="ntp ufw bftpd openssh "

PKG_DESKTOP+="xdg-user-dirs "

# cinnamon
PKG_DESKTOP+="cinnamon "

# core applications
PKG_DESKTOP+="archey3 baobab bleachbit catfish curl wget "
PKG_DESKTOP+="darktable dconf-editor tlp powertop"
PKG_DESKTOP+="dmidecode filezilla gedit "
PKG_DESKTOP+="galculator glances gnome-disk-utility "
PKG_DESKTOP+="gnome-keyring gnome-screenshot "
PKG_DESKTOP+="gnome-terminal gnome-font-viewer gnome-system-monitor "
PKG_DESKTOP+="gparted gpick grsync gnome-power-manager"
PKG_DESKTOP+="lm_sensors lsb-release meld mlocate "
PKG_DESKTOP+="hardinfo hddtemp hexchat htop hwinfo "
PKG_DESKTOP+="numlockx openshot pinta vlc "
PKG_DESKTOP+="redshift sane scrot shotwell "
PKG_DESKTOP+="simple-scan simplescreenrecorder smplayer sysstat "
PKG_DESKTOP+="audacious audacious-plugins playerctl "
PKG_DESKTOP+="unzip unrar p7zip file-roller libgtop "
PKG_DESKTOP+="evince nemo-fileroller nemo-preview "
PKG_DESKTOP+="nemo-image-converter nemo-seahorse nemo-share "

# printer
PKG_DESKTOP+="system-config-printer ghostscript python-pysmbc libsecret "
PKG_DESKTOP+="cups cups-pdf cups-pk-helper libcups hplip gsfonts "

# audio
PKG_DESKTOP+="pulseaudio pulseaudio-alsa "
PKG_DESKTOP+="alsa-utils alsa-plugins alsa-lib alsa-firmware "

# Network
PKG_DESKTOP+="net-tools networkmanager dnsmasq avahi nss-mdns "
PKG_DESKTOP+="network-manager-applet "

# Bluetooth
PKG_DESKTOP+="blueberry "

# locale
PKG_DESKTOP_AUR+="mintlocale "

# themes
PKG_DESKTOP_AUR+="mint-themes mint-x-icons mint-y-icons "
PKG_DESKTOP_AUR+="cinnamon-sound-effects mint-sounds "

# apps
PKG_DESKTOP+="chromium "
PKG_DESKTOP_AUR+="brave-bin "

# Fonts, Fonts, Fonts ans more Fonts!
PKG_DESKTOP+="ttf-dejavu ttf-ubuntu-font-family noto-fonts ttf-croscore "
PKG_DESKTOP+="ttf-roboto ttf-freefont ttf-hack ttf-inconsolata "
PKG_DESKTOP+="adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts "
PKG_DESKTOP_AUR+="ttf-arabeyes-fonts "

# Install the listed software
sudo pacman -S --needed --noconfirm ${PKG_DESKTOP}
yay -S --needed --noconfirm ${PKG_DESKTOP_AUR}


# Config lightdm to use gtk-greeter
GREETER_CONF="greeter-session=lightdm-gtk-greeter"
GREETER_SCRIPT_CONF="greeter-setup-script=xset b off"

if [[ ! $(cat /etc/lightdm/lightdm.conf | grep -v "^#" | grep greeter-session) ]]; then
  sudo sed -i "/^\[Seat\:\*\]/a${GREETER_CONF}" /etc/lightdm/lightdm.conf
fi

if [[ ! $(cat /etc/lightdm/lightdm.conf | grep -v "^#" | grep greeter-setup-script) ]]; then
  sudo sed -i "/^\[Seat\:\*\]/a${GREETER_SCRIPT_CONF}" /etc/lightdm/lightdm.conf
fi

# Enable DE 
sudo systemctl enable lightdm.service

systemctl enable org.cups.cupsd.service
systemctl start org.cups.cupsd.service

# Enable ntp
sudo systemctl enable ntpd.service
sudo systemctl start ntpd.service

# Enable ufw
sudo systemctl enable ufw.service
sudo systemctl start ufw.service

# Enable network
sudo systemctl enable NetworkManager.service
sudo systemctl start NetworkManager.service

# Enable sweet power saving
sudo systemctl enable tlp.service
sudo systemctl enable tlp-sleep.service
sudo systemctl start tlp.service
sudo systemctl start tlp-sleep.service

#enable ahavi
MDSN_CONF="mdns4_minimal [NOTFOUND=return]"
if [[ ! $(cat /etc/nsswitch.conf | grep "${MDSN_CONF}") ]]; then
  sudo sed -r -i "s/(hosts\:.*)( resolve)/\1 ${MDSN_CONF}\2 /" /etc/nsswitch.conf
fi
sudo systemctl enable avahi-daemon.service
sudo systemctl start avahi-daemon.service

# Set color on pacman
sudo sed -i 's/#Color/Color/' /etc/pacman.conf

# Reduce swappiness
sudo sh -c 'printf "vm.swappiness=10" > /etc/sysctl.d/99-sysctl.conf'

./install-wallpapers.sh

