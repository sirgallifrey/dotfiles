#!/bin/bash

echo "Creating npm global dir for $(whoami)"
mkdir -p ~/npm/bin
npm config set prefix '~/npm'

