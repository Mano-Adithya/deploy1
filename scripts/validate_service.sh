#!/bin/bash
set -e

# Service name
SERVICE_NAME="my-service"

# Check if service is active
if sudo systemctl is-active --quiet $SERVICE_NAME; then
    echo "Service $SERVICE_NAME is active."
else
    echo "ERROR: Service $SERVICE_NAME is not active."
    exit 1
fi
