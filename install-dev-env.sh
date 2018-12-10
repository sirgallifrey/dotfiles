#!/bin/bash

# apps
PKG_DESKTOP+="chromium firefox-developer-edition pgadmin3 "
PKG_DESKTOP+="docker docker-compose nodejs-lts-dubnium yarn "
PKG_DESKTOP+="dotnet-host dotnet-sdk dotnet-runtime aspnet-runtime "
PKG_DESKTOP_AUR+="visual-studio-code-bin "


# Install the listed software
sudo pacman -S --needed --noconfirm ${PKG_DESKTOP}
yaourt -S --needed --noconfirm ${PKG_DESKTOP_AUR}

