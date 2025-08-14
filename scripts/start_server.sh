#!/usr/bin/env bash
set -e

# Start with PM2 (simple for Node apps)
sudo pkill -f "node" || true

# Start the application
npm start >/dev/null 2>&1 &