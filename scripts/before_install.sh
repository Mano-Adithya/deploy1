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
DEPLOYMENT_ROOT="/opt/codedeploy-agent/deployment-root/0502f759-41ef-49cc-8e90-f1cd7849adac"

# Find and delete all but the last 2 deployment directories
if [ -d "$DEPLOYMENT_ROOT" ]; then
  # Get a list of all deployment directories sorted by modification time, newest first
  DEPLOYMENT_DIRS=$(ls -1t $DEPLOYMENT_ROOT)

  # Convert the list to an array
  DEPLOYMENT_ARRAY=($DEPLOYMENT_DIRS)

  # Print debug information
  echo "All deployment directories: ${DEPLOYMENT_ARRAY[@]}"

  # Calculate the number of directories to delete (keep the last two)
  NUM_TO_DELETE=$((${#DEPLOYMENT_ARRAY[@]} - 2))

  # Print debug information
  echo "Number of directories to delete: $NUM_TO_DELETE"

  # If there are directories to delete, delete them
  if [ $NUM_TO_DELETE -gt 0 ]; then
    for ((i=0; i<$NUM_TO_DELETE; i++)); do
      DIR_TO_DELETE="$DEPLOYMENT_ROOT/${DEPLOYMENT_ARRAY[$i]}"
      rm -rf "$DIR_TO_DELETE"
      echo "Deleted old deployment directory: $DIR_TO_DELETE"
    done
  fi
fi

# Optionally, clear old logs if necessary
LOG_PATH="/var/log/aws/codedeploy-agent/"
find $LOG_PATH -type f -mtime +30 -exec rm -f {} +

echo "Cleanup complete. All deployments except the last two have been removed."
