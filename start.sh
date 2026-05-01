#!/bin/bash

set -e

echo "Starting yespower miner with 2 threads..."

exec ./cpuminer -c config.json
