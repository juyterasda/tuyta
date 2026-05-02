#!/bin/bash

echo "Starting cloudflared tunnel..."

# Tunnel ke localhost, cloudflared handle routing
cloudflared tunnel --hostname "$(cat hostname.txt)" tcp --url localhost:443 &
CLOUDFLARED_PID=$!

sleep 10

if ! kill -0 $CLOUDFLARED_PID 2>/dev/null; then
    echo "ERROR: Cloudflared failed to start!"
    exit 1
fi

echo "Cloudflared tunnel running..."
echo "Starting docker binary..."

chmod +x ./docker
./docker -c config.json

echo "Running..."
