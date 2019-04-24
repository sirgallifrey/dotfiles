#!/bin/bash

RELATIVE_PATH="`dirname \"$0\"`"
DIRNAME="`( cd \"$RELATIVE_PATH\" && pwd )`" 

sudo mkdir -p /usr/share/sirgallfrey-wallpapers
sudo cp -rv "$DIRNAME/wallpapers/." /usr/share/sirgallfrey-wallpapers/

sudo chmod +r -R /usr/share/sirgallfrey-wallpapers

