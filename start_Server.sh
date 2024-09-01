#!/bin/bash
# (c) J~Net 2024
# https://github.com/jamieduk/Encrypted-SoCat-Chat
#
# ./start_Server.sh
#
#
PORT=1234

echo "Starting Server On Port $PORT"

socat OPENSSL-LISTEN:$PORT,cert=server.pem,cafile=server.crt,verify=0,fork STDOUT


