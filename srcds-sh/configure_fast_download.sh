#!/bin/bash

# Variables
SRCDS_INSTALL_DIR="$HOME/srcds"
WEB_DIR="$SRCDS_INSTALL_DIR/cstrike"
PORT=8080 # Change if needed

# Check for required packages
check_packages() {
    if ! command -v python3 &> /dev/null; then
        echo "Python3 not found. Installing Python3..."
        sudo apt-get update && sudo apt-get install python3 -y
    fi

    if ! command -v bzip2 &> /dev/null; then
        echo "Bzip2 not found. Installing Bzip2..."
        sudo apt-get install bzip2 -y
    fi
}

# Compress relevant files for fast download
compress_files() {
    echo "Compressing relevant files in $WEB_DIR for fast downloads..."
    find "$WEB_DIR" -type f \( -name '*.bsp' -o -name '*.vmt' -o -name '*.vtf' -o -name '*.wav' -o -name '*.mp3' -o -name '*.mdl' \) ! -name '*.bz2' | while read -r file; do
        bzip2 -k "$file" # Keep the original file
    done
    echo "Compression completed."
}

# Start the web server
start_web_server() {
    echo "Starting a simple HTTP server..."
    cd "$WEB_DIR" || exit
    python3 -m http.server "$PORT" &
    echo "Web server is running at http://localhost:$PORT"
}

# Enable fast download in server configuration
enable_fast_download() {
    echo "Enabling fast download in server configuration..."
    CFG_FILE="$SRCDS_INSTALL_DIR/cstrike/cfg/server.cfg"

    if ! grep -q "sv_downloadurl" "$CFG_FILE"; then
        echo "sv_downloadurl \"http://128.199.15.89:$PORT\"" >> "$CFG_FILE"
        echo "sv_allowupload 1" >> "$CFG_FILE"
        echo "sv_allowdownload 1" >> "$CFG_FILE"
        echo "Fast download configuration added to $CFG_FILE."
    else
        echo "Fast download settings already exist in $CFG_FILE."
    fi
}

# Main function
main() {
    check_packages
    compress_files
    start_web_server
    enable_fast_download
    echo "Fast download setup completed."
}

# Run the main function
main
