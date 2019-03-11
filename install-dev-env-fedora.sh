#!/bin/bash

# instal rustup
curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path --default-toolchain stable

# install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

sudo dnf install -y docker docker-compose code brave-browser brave-keyring dotnet-sdk-2.2

_ME=$(whoami)
sudo groupadd docker
sudo usermod -aG docker $_ME
