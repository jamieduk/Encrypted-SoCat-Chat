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

#!/bin/bash

# Check if client.pem exists
if [ ! -f client.pem ]; then
  echo "client.pem does not exist. Generating new key and certificate..."
  echo "Skip itall excpet common name needsto be ipordomain name (fqdn)"
  echo ""
  # Generate a new private key
  sudo apt install -y openssl
  openssl genrsa -out client.key 2048

  # Create a new certificate signing request and self-signed certificate
  openssl req -new -key client.key -x509 -days 3653 -out client.crt

  # Combine the key and certificate into a PEM file
  cat client.key client.crt > client.pem

  # Set appropriate permissions
  chmod 600 client.key client.pem

  echo "client.pem has been created and permissions have been set."
else
  echo "client.pem already exists. Skipping generation."
fi

# Prompt user for server host, use default if no input
read -p "Enter server host [$DEFAULT_SRV_HOST]: " SRV_HOST
SRV_HOST=${SRV_HOST:-$DEFAULT_SRV_HOST}

# Prompt user for port, use default if no input
read -p "Enter port [$DEFAULT_PORT]: " PORT
PORT=${PORT:-$DEFAULT_PORT}

echo "Connecting To Server $SRV_HOST On Port $PORT"

# Connect to server using socat
#socat - OPENSSL:$SRV_HOST:$PORT,verify=0

# Encypted 2 way
socat - OPENSSL:$SRV_HOST:$PORT,cert=client.pem,verify=0





