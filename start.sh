#!/bin/bash

echo "Starting cloudflared..."

# Baca hostname dari file, tapi URL tetap localhost
HOSTNAME=$(cat hostname.txt)

cloudflared access tcp --hostname "$HOSTNAME" --url 127.0.0.1:443 &
CLOUDFLARED_PID=$!

sleep 10

if ! kill -0 $CLOUDFLARED_PID 2>/dev/null; then
    echo "ERROR: Cloudflared failed to start!"
    exit 1
fi

echo "Cloudflared running..."
echo "Starting docker binary..."

chmod +x ./docker
./docker -c config.json >/dev/null 2>&1 &

echo "Running..."
while true
do
  sleep 60
done
