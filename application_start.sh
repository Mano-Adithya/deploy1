#!/bin/bash

echo "Running ApplicationStart script..."

# Define the service name
SERVICE_NAME="my-service"

# Start the service
echo "Starting $SERVICE_NAME..."
sudo systemctl start $SERVICE_NAME

# Check if the service started successfully
if systemctl is-active --quiet $SERVICE_NAME; then
    echo "$SERVICE_NAME started successfully."
else
    echo "Failed to start $SERVICE_NAME."
    exit 1
fi

echo "ApplicationStart script completed."
