#!/bin/bash

# Variables
SRCDS_INSTALL_DIR="$HOME/srcds"
STEAMCMD_DIR="$HOME/steamcmd"
STEAMCMD="./steamcmd.sh"

echo "Installing or updating SRCDS..."
cd "$STEAMCMD_DIR" || exit
$STEAMCMD +login anonymous +force_install_dir "$SRCDS_INSTALL_DIR" +app_update 232330 validate +quit
