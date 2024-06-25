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
  # List deployment directories sorted by modification time, newest first
  DEPLOYMENT_DIRS=$(ls -1t $DEPLOYMENT_ROOT)
  
  # Convert the list to an array
  DEPLOYMENT_ARRAY=($DEPLOYMENT_DIRS)
  
  # Calculate the number of directories to delete
  NUM_TO_DELETE=$((${#DEPLOYMENT_ARRAY[@]} - 2))
  
  # If there are more than 2 directories, delete the oldest ones
  if [ $NUM_TO_DELETE -gt 0 ]; then
    for ((i=2; i<${#DEPLOYMENT_ARRAY[@]}; i++)); do
      rm -rf $DEPLOYMENT_ROOT/${DEPLOYMENT_ARRAY[i]}
      echo "Deleted old deployment directory: $DEPLOYMENT_ROOT/${DEPLOYMENT_ARRAY[i]}"
    done
  fi
fi

# Optionally, clear old logs if necessary
LOG_PATH="/var/log/aws/codedeploy-agent/"
find $LOG_PATH -type f -mtime +30 -exec rm -f {} +

echo "Cleanup complete. Old deployments and logs older than 30 days have been removed."
