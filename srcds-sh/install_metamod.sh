#!/bin/bash

# Variables
SRCDS_INSTALL_DIR="$HOME/srcds"
GAME="cstrike"
METAMOD_URL="https://mms.alliedmods.net/mmsdrop/2.0/mmsource-2.0.0-git1313-linux.tar.gz"

echo "Installing or updating Metamod:Source..."
cd "$SRCDS_INSTALL_DIR/$GAME" || exit

if [ ! -d "addons/metamod" ]; then
    curl -SL "$METAMOD_URL" -o metamod.tar.gz
    tar -xzf metamod.tar.gz
    rm metamod.tar.gz
    echo "Metamod:Source installed!"
else
    echo "Metamod:Source is already installed."
fi
