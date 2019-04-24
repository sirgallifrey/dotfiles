#!/bin/bash

# apps
PKG_DESKTOP+="google-chrome spotify enpass-bin vlc krita "

# Install the listed software
yay -S --needed --noconfirm ${PKG_DESKTOP_AUR}

