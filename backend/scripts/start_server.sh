#!/bin/bash
set -e

APP_DIR="/home/ec2-user/app"
ECOSYSTEM_CONFIG="/home/ec2-user/ecosystem.config.js"

echo "Navigating to the backend directory..."
cd "$APP_DIR" || { echo "Failed to navigate to backend directory"; exit 1; }

echo "Starting the Node.js server using pm2..."

# Use ecosystem config if available, otherwise start directly
if [ -f "$ECOSYSTEM_CONFIG" ]; then
    pm2 start "$ECOSYSTEM_CONFIG" --update-env
else
    pm2 start npm --name "nodeapp-backend" -- start
fi

# Save the pm2 process list
echo "Saving the pm2 process list..."
pm2 save --force

echo "Node.js server started successfully"
pm2 status

exit 0