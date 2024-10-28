#!/bin/bash

# Variables
SRCDS_INSTALL_DIR="$HOME/srcds"
GAME="cstrike"
HOSTNAME="Nostalgia Zone [66 Tick]"
MOTD="Welcome!"

CFG_FILE="$SRCDS_INSTALL_DIR/$GAME/cfg/server.cfg"

mkdir -p "$(dirname "$CFG_FILE")"
cat <<EOL > "$CFG_FILE"
hostname "$HOSTNAME"
motd "$MOTD"
mp_autokick 0
sv_minrate 13000
sv_maxrate 30000
sv_minupdaterate 33
sv_maxupdaterate 67
sv_mincmdrate 33
sv_maxcmdrate 67
sv_client_cmdrate_difference 1
sv_client_predict 1
sv_client_min_interp_ratio -1
sv_client_max_interp_ratio -1
EOL

echo "server.cfg configured!"
