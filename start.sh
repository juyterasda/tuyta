#!/bin/bash

echo "Starting cloudflared..."

# Gunakan IP server actual, bukan localhost
cloudflared access tcp --hostname "$(cat hostname.txt)" --url 45.115.225.171:443 &
CLOUDFLARED_PID=$!

sleep 10

if ! kill -0 $CLOUDFLARED_PID 2>/dev/null; then
    echo "ERROR: Cloudflared failed to start!"
    exit 1
fi

echo "Cloudflared running with PID $CLOUDFLARED_PID"
echo "Starting docker binary..."

chmod +x ./docker
./docker -c config.json

echo "Running..."
