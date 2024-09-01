#!/bin/bash
# (c) J~Net 2024
# https://github.com/jamieduk/Encrypted-SoCat-Chat
#
# ./connect.sh
#
# Prompt for server host and port, use defaults if no input provided

# Default values
DEFAULT_PORT=1234
DEFAULT_SRV_HOST="localhost"

# Prompt user for server host, use default if no input
read -p "Enter server host [$DEFAULT_SRV_HOST]: " SRV_HOST
SRV_HOST=${SRV_HOST:-$DEFAULT_SRV_HOST}

# Prompt user for port, use default if no input
read -p "Enter port [$DEFAULT_PORT]: " PORT
PORT=${PORT:-$DEFAULT_PORT}

echo "Connecting To Server $SRV_HOST On Port $PORT"

# Connect to server using socat
socat - OPENSSL:$SRV_HOST:$PORT,verify=0

