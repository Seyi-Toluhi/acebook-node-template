#!/usr/bin/env bash
set -e
cd /srv/app
# Start with PM2 (simple for Node apps)
if ! command -v pm2 >/dev/null 2>&1; then
  sudo npm install -g pm2
fi
pm2 delete all || true
pm2 start npm --name "node-app" -- start
pm2 save
