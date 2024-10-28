#!/bin/bash

# Variables
SRCDS_INSTALL_DIR="$HOME/srcds"
GAME="cstrike"
SRCDS_PORT=27015
SRCDS_MAXPLAYERS=24
SRCDS_MAP="de_dust2"

cd "$SRCDS_INSTALL_DIR" || exit
./srcds_run -game "$GAME" -console -usercon +map "$SRCDS_MAP" -port "$SRCDS_PORT" +maxplayers "$SRCDS_MAXPLAYERS"
