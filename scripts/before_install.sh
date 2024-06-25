#!/bin/bash

# Define the destination directory
DESTINATION_DIR="/var/www/myapp"

# Check if the directory exists
if [ -d "$DESTINATION_DIR" ]; then
  # Remove all contents of the directory
  rm -rf $DESTINATION_DIR/*
  echo "Cleaned up $DESTINATION_DIR"
else
  # Create the directory if it doesn't exist
  mkdir -p $DESTINATION_DIR
  echo "Created $DESTINATION_DIR"
fi

# Define the path to the CodeDeploy deployment root
DEPLOYMENT_ROOT="/opt/codedeploy-agent/deployment-root/"

# Define the number of days after which deployments should be considered old
DAYS=30

# Find and delete old deployment directories
find $DEPLOYMENT_ROOT -type d -mtime +$DAYS -exec rm -rf {} +

# Optionally, clear old logs if necessary
LOG_PATH="/var/log/aws/codedeploy-agent/"
find $LOG_PATH -type f -mtime +$DAYS -exec rm -f {} +

echo "Cleanup complete. Old deployments and logs older than $DAYS days have been removed."
