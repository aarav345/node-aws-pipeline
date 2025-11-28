#!/bin/bash
set -e

APP_DIR="/home/ec2-user/app"

echo "Ensuring the backend directory exists..."
mkdir -p "$APP_DIR"
echo "Backend directory is ready at $APP_DIR"

# Clear old files but keep directory structure
echo "Clearing old application files..."
cd "$APP_DIR"
rm -rf node_modules package-lock.json .env 2>/dev/null || true

echo "Cleanup completed"
exit 0