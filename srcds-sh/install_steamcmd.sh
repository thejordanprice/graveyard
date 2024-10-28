#!/bin/bash

# Variables
STEAMCMD_DIR="$HOME/steamcmd"
STEAMCMD="./steamcmd.sh"

# Function to check if SteamCMD is installed
if [ ! -f "$STEAMCMD_DIR/$STEAMCMD" ]; then
    echo "SteamCMD not found. Installing SteamCMD..."
    mkdir -p "$STEAMCMD_DIR"
    cd "$STEAMCMD_DIR" || exit
    curl -O https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
    tar -xvzf steamcmd_linux.tar.gz
else
    echo "SteamCMD is already installed."
fi
