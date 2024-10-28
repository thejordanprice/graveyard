#!/bin/bash

# Variables
SRCDS_INSTALL_DIR="$HOME/srcds"
GAME="cstrike"
ADMINS=("STEAM_0:0:32022486")  # Add more Steam IDs as needed

ADMIN_FILE="$SRCDS_INSTALL_DIR/$GAME/addons/sourcemod/configs/admins_simple.ini"

if [ -f "$ADMIN_FILE" ]; then
    echo "Configuring admins..."
    for STEAMID in "${ADMINS[@]}"; do
        if ! grep -q "$STEAMID" "$ADMIN_FILE"; then
            echo "\"$STEAMID\" \"99:z\"" >> "$ADMIN_FILE"
        fi
    done
else
    echo "ERROR: Sourcemod admin file not found."
    exit 1
fi
