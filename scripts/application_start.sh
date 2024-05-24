#!/bin/bash
set -e

# Log start of script
echo "Running ApplicationStart script..."

# Start service if it exists
if systemctl list-unit-files | grep -q "my-service.service"; then
    echo "Starting my-service..."
    sudo systemctl start my-service.service
else
    echo "Service my-service not found or not installed."
    # Handle the case where the service is not found or installed
fi
