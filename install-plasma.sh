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
PKG_DESKTOP+="xorg mesa lib32-mesa mesa-libgl xorg-drivers "
PKG_DESKTOP+="libx264 "

# Intel
PKG_DESKTOP+="vulkan-intel "

# SDDM
PKG_DESKTOP+="sddm sddm-kcm "

# system
PKG_DESKTOP+="ntp ufw bftpd "

# plasma
# for now, i'm installing everyting on plasma group until I figure out what I don't need. 
PKG_DESKTOP+="plasma partitionmanager "

# kde-applications
# NOTE: I'll leave kwalletmanager out for a time, it is a pain in the ass.
# 
PKG_DESKTOP+="dolphin dolphin-plugins dragon filelight "
PKG_DESKTOP+="gwenview kamera kamoso kate "
PKG_DESKTOP+="purpose kdegraphics-thumbnailers spectacle "
PKG_DESKTOP+="kde-cli-tools kcharselect ffmpegthumbs "
PKG_DESKTOP+="kcolorchooser kcron kdenetwork-filesharing "
PKG_DESKTOP+="kdesdk-thumbnailers kdf kdialog kfind kget "
PKG_DESKTOP+="kgpg kleopatra kolourpaint kompare "
PKG_DESKTOP+="ksystemlog kwrite ocular "
PKG_DESKTOP+="sweeper umbrello ark kcalc kdenlive khelpcenter "
PKG_DESKTOP+="kio-extras kruler signon-kwallet-extension "
PKG_DESKTOP+="kio-gdrive "

#redshift
PKG_DESKTOP+="redshift plasma5-applets-redshift-control "
PKG_DESKTOP+="libappindicator-gtk3 "

# Sound
PKG_DESKTOP+="pulseaudio paprefs pulseaudio-alsa "
PKG_DESKTOP+="pavucontrol alsa-utils pulseaudio-zeroconf "
PKG_DESKTOP+="libcanberra libcanberra-pulse "

# Printer
# This setup is not good yet... I can't configure printers as a normal user
PKG_DESKTOP+="print-manager cups cups-pdf polkit cups-pk-helper "

# (Fallback) Themes
PKG_DESKTOP+="elementary-icon-theme "
PKG_DESKTOP+="faenza-icon-theme papirus-icon-theme deepin-icon-theme "
PKG_DESKTOP_AUR+="numix-icon-theme-git "

# Network
PKG_DESKTOP+="networkmanager plasma-nm dnsmasq avahi nss-mdns "

# Install other DE related tools/plugins
PKG_DESKTOP+="dconf-editor xdg-user-dirs "

# ssh
PKG_DESKTOP+="openssh ksshaskpass "

# terminal
#TODO: check if I need vte3
PKG_DESKTOP+="termite "

# apps
PKG_DESKTOP+="vlc "
PKG_DESKTOP_AUR+="brave-bin "

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

# enable triple buffer to avoid screen tearing in kde
sudo touch /etc/profile.d/kwin.sh
sudo chmod +x /etc/profile.d/kwin.sh
sudo sh -c 'printf "export KWIN_TRIPLE_BUFFER=1" > /etc/profile.d/kwin.sh'

# Reduce swappiness
sudo sh -c 'printf "vm.swappiness=10" > /etc/sysctl.d/99-sysctl.conf'

# copy config files
copy_files
