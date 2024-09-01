#!/bin/bash
# (c) J~Net 2024
# https://github.com/jamieduk/Encrypted-SoCat-Chat
#
# ./connect.sh
#
#
PORT=1234
SRV_HOST="localhost"

echo "Connecting To Server $SRV_HOST On Port $PORT"

socat - OPENSSL:$SRV_HOST:$PORT,verify=0


