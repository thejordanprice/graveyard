#!/bin/bash

# Variables
SRCDS_INSTALL_DIR="$HOME/srcds"
GAME="cstrike"
ADMINMENU_FILE="$SRCDS_INSTALL_DIR/$GAME/addons/sourcemod/configs/adminmenu_cfgs.txt"

if [ -f "$ADMINMENU_FILE" ]; then
    # Update adminmenu_cfgs.txt with new map configurations
    TEMP_FILE=$(mktemp)
    echo "Updating adminmenu_cfgs.txt..."

    {
        echo "/**"
        echo " * List config files here (relative to moddir) to have them added to the exec menu"
        echo " * Left side is the filename, right side is the text to be added to the menu"
        echo " */"
        echo "Configs"
        echo "{"
        echo "        \"cfg/sourcemod/surf_on.cfg\" \"surf_on.cfg\""
        echo "        \"cfg/sourcemod/surf_off.cfg\" \"surf_off.cfg\""
        echo "        \"cfg/sourcemod/scoutzknivez_on.cfg\" \"scoutzknivez_on.cfg\""
        echo "        \"cfg/sourcemod/scoutzknivez_off.cfg\" \"scoutzknivez_off.cfg\""
        echo "}"
    } > "$TEMP_FILE"

    mv "$TEMP_FILE" "$ADMINMENU_FILE"
    echo "adminmenu_cfgs.txt updated!"
else
    echo "ERROR: adminmenu_cfgs.txt not found."
    exit 1
fi
