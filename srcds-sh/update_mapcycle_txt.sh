#!/bin/bash

# Variables
SRCDS_INSTALL_DIR="$HOME/srcds"
GAME="cstrike"
MAP_DIR="$SRCDS_INSTALL_DIR/$GAME/maps"
MAPCYCLE_FILE="$SRCDS_INSTALL_DIR/$GAME/cfg/mapcycle_default.txt"

# Create or clear the mapcycle_default.txt file
echo "// Default mapcycle file for Counter-Strike." > "$MAPCYCLE_FILE"
echo "" >> "$MAPCYCLE_FILE"
echo "// DO NOT MODIFY THIS FILE!" >> "$MAPCYCLE_FILE"
echo "// Instead, copy it to mapcycle.txt and modify that file.  If no custom mapcycle.txt file is found," >> "$MAPCYCLE_FILE"
echo "// this file will be used as the default." >> "$MAPCYCLE_FILE"
echo "" >> "$MAPCYCLE_FILE"
echo "// Also, note that the \"mapcyclefile\" convar can be used to specify a particular mapcycle file." >> "$MAPCYCLE_FILE"
echo "" >> "$MAPCYCLE_FILE"

# Populate the mapcycle_default.txt file with map names
for map in "$MAP_DIR"/*.bsp; do
    if [[ -f "$map" ]]; then
        # Strip the path and .bsp extension
        map_name=$(basename "$map" .bsp)
        echo "$map_name" >> "$MAPCYCLE_FILE"
    fi
done

echo "mapcycle_default.txt has been populated with maps from $MAP_DIR."
