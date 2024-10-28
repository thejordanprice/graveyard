#!/bin/bash

# Variables
SRCDS_INSTALL_DIR="$HOME/srcds"
GAME="cstrike"
SM_CFG_DIR="$SRCDS_INSTALL_DIR/$GAME/cfg/sourcemod"
NORMAL_CFG_DIR="$SRCDS_INSTALL_DIR/$GAME/cfg"

# Create necessary directories
mkdir -p "$SM_CFG_DIR"
mkdir -p "$NORMAL_CFG_DIR"

# Surf configurations
cat <<EOL > "$SM_CFG_DIR/surf_on.cfg"
// Surf settings
sv_accelerate 10
sv_airaccelerate 800
EOL

cat <<EOL > "$SM_CFG_DIR/surf_off.cfg"
// Revert surf settings to defaults
sv_accelerate 5.6
sv_airaccelerate 12
EOL

# Create the same Surf configurations in the normal cfg directory
cat <<EOL > "$NORMAL_CFG_DIR/surf_.cfg"
// Surf settings
sv_accelerate 10
sv_airaccelerate 800
EOL

# Scoutzknivez configurations
cat <<EOL > "$SM_CFG_DIR/scoutzknivez_on.cfg"
// Scoutzknivez settings
sv_airaccelerate 700
sv_gravity 220
sv_staminajumpcost 0
sv_staminalandcost 0
sv_maxspeed 3500
EOL

cat <<EOL > "$SM_CFG_DIR/scoutzknivez_off.cfg"
// Revert scoutzknivez settings to defaults
sv_airaccelerate 10
sv_gravity 800
sv_staminajumpcost 0.080
sv_staminalandcost 0.050
sv_maxspeed 320
EOL

# Create the same Scoutzknivez configurations in the normal cfg directory
cat <<EOL > "$NORMAL_CFG_DIR/scoutzknivez.cfg"
// Scoutzknivez settings
sv_airaccelerate 700
sv_gravity 220
sv_staminajumpcost 0
sv_staminalandcost 0
sv_maxspeed 3500
EOL

echo "Map configuration files created in both Sourcemod and normal cfg directories."
