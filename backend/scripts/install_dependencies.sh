#!/bin/bash
set -e

APP_DIR="/home/ec2-user/app"

echo "Navigating to the backend directory..."
cd "$APP_DIR" || { echo "Failed to navigate to $APP_DIR"; exit 1; }
echo "Successfully navigated to $APP_DIR"

echo "Running npm install to install dependencies..."
npm ci --production || npm install --production

echo "npm install completed successfully"
exit 0