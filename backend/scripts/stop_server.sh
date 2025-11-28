#!/bin/bash
set -e

echo "Attempting to stop the Node.js server using pm2..."

# Check if PM2 is installed
if ! command -v pm2 &> /dev/null; then
    echo "PM2 not found, nothing to stop"
    exit 0
fi

# Stop and delete the process
pm2 stop nodeapp-backend 2>/dev/null || echo "No pm2 process found with name 'nodeapp-backend'"
pm2 delete nodeapp-backend 2>/dev/null || echo "No pm2 process to delete"

# Alternative: stop all PM2 apps
# pm2 stop all
# pm2 delete all

echo "PM2 stop and delete process completed"
exit 0