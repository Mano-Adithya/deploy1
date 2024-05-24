#!/bin/bash
set -e

# Service name
SERVICE_NAME="my-service"

# Check if service exists
if sudo systemctl list-unit-files | grep -q "$SERVICE_NAME.service"; then
    # Check if service is active
    if sudo systemctl is-active --quiet $SERVICE_NAME; then
        echo "Service $SERVICE_NAME is active."
        exit 0
    else
        echo "ERROR: Service $SERVICE_NAME is not active."
        exit 1
    fi
else
    echo "Service $SERVICE_NAME does not exist."
    exit 0
fi
