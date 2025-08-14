#!/usr/bin/env bash
set -e
cd /srv/app
# Ensure node/npm exist on the instance (install once via nvm or yum if needed)
if [ -f package-lock.json ]; then
  npm ci
elif [ -f package.json ]; then
  npm install
fi
