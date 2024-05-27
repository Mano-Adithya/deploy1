#!/bin/bash

# Check if the service is running
if systemctl is-active --quiet myapp; then
    echo "Stopping myapp service..."
    # Stop the service
    sudo systemctl stop myapp
else
    echo "myapp service is not running."
fi

# Verify the service is stopped
if systemctl is-active --quiet myapp; then
    echo "Failed to stop myapp service."
    exit 1
else
    echo "myapp service stopped successfully."
fi

