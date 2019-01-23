#!/bin/bash

RELATIVE_PATH="`dirname \"$0\"`"
DIRNAME="`( cd \"$RELATIVE_PATH\" && pwd )`" 

sudo mkdir -p /usr/share/wallpapers/SirGallifrey/contents/images
sudo cp -rv "$DIRNAME/wallpapers/." /usr/share/wallpapers/SirGallifrey/contents/images/
