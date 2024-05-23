#!/bin/bash

SERVICE_NAME="my-service.service"

echo "Running BeforeInstall script..."

# Check if the service is loaded
if systemctl list-units --type=service --all | grep -q "$SERVICE_NAME"; then
    echo "$SERVICE_NAME is loaded. Attempting to stop it..."
    sudo systemctl stop $SERVICE_NAME
    if [ $? -eq 0 ]; then
        echo "$SERVICE_NAME stopped successfully."
    else
        echo "Failed to stop $SERVICE_NAME."
        exit 1
    fi
else
    echo "$SERVICE_NAME is not loaded. Skipping stop operation."
fi

echo "BeforeInstall script completed."
