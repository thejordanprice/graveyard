#!/bin/bash

# Variables
SRCDS_INSTALL_DIR="$HOME/srcds"
GAME="cstrike"
SOURCEMOD_URL="https://sm.alliedmods.net/smdrop/1.11/sourcemod-1.11.0-git6968-linux.tar.gz"

echo "Installing or updating Sourcemod..."
cd "$SRCDS_INSTALL_DIR/$GAME" || exit

if [ ! -d "addons/sourcemod" ]; then
    curl -SL "$SOURCEMOD_URL" -o sourcemod.tar.gz
    tar -xzf sourcemod.tar.gz
    rm sourcemod.tar.gz
    echo "Sourcemod installed!"
else
    echo "Sourcemod is already installed."
fi
