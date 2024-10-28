# SRCDS Setup Script

This repository contains a Bash script for automatically setting up a Source Dedicated Server (SRCDS) for Counter-Strike: Source. The script installs SteamCMD, SRCDS, Metamod:Source, and SourceMod, along with configuring server settings, admin users, and a message of the day (MOTD).

## Features

- **Automatic Installation**: Installs SteamCMD and SRCDS with a single command.
- **Plugin Support**: Installs Metamod:Source and SourceMod for server customization.
- **Admin Configuration**: Easily manage admin users through a defined list of SteamIDs.
- **Custom Server Settings**: Set server title, MOTD, tick rate, and other parameters in `server.cfg`.

## Requirements

- A Linux-based operating system
- `curl` and `tar` utilities installed
- Access to the terminal/command line

## Usage

1. Clone the repository:

   ```bash
   git clone https://github.com/thejordanprice/srcds-sh.git
   cd srcds-sh

2. Make the scripts executable:

   ```bash
   chmod +x *.sh

3. Run the script:

   ```bash
   ./main.sh

## Configuration
You can modify the following variables in the script to customize your server:

- SRCDS_PORT: Port number for the server (default: 27015)
- SRCDS_MAXPLAYERS: Maximum number of players (default: 24)
- SRCDS_MAP: Starting map (default: de_dust2)
- ADMINS: Array of SteamIDs for admin users
- HOSTNAME: Title of the server in browser
- MOTD: Message of the day
