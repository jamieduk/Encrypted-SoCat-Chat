#!/bin/bash
# (c) J~Net 2024
# https://github.com/jamieduk/Encrypted-SoCat-Chat
#
# ./setup.sh
#
#
sudo apt install -y socat openssl

echo "Generating New key"

openssl req -newkey rsa:4096 -nodes -keyout server.key -x509 -days 365 -out server.crt

cat server.key server.crt > server.pem

#socat OPENSSL-LISTEN:1234,cert=server.pem,cafile=server.crt,verify=0,fork STDOUT

echo "Now Start using ./start_Server.sh"

