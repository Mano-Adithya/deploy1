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

# Find and delete all but the last 2 deployment directories
if [ -d "$DEPLOYMENT_ROOT" ]; then
  # Get a list of deployment directories sorted by modification time, oldest first
  DEPLOYMENT_DIRS=$(ls -1t $DEPLOYMENT_ROOT | tail -n +3)
  
  # Loop through the list and delete each directory
  for DIR in $DEPLOYMENT_DIRS; do
    rm -rf $DEPLOYMENT_ROOT/$DIR
    echo "Deleted old deployment directory: $DEPLOYMENT_ROOT/$DIR"
  done
fi

# Optionally, clear old logs if necessary
LOG_PATH="/var/log/aws/codedeploy-agent/"
find $LOG_PATH -type f -mtime +30 -exec rm -f {} +

echo "Cleanup complete. Old deployments and logs older than 30 days have been removed."
