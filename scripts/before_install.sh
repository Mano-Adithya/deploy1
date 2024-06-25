#!/bin/bash

# Define the path to the CodeDeploy deployment root
DEPLOYMENT_ROOT="/opt/codedeploy-agent/deployment-root/"

# Define the number of days after which deployments should be considered old
DAYS=1

# Find and delete old deployment directories
find $DEPLOYMENT_ROOT -type d -mtime +$DAYS -exec rm -rf {} +

# Optionally, clear old logs if necessary
LOG_PATH="/var/log/aws/codedeploy-agent/"
find $LOG_PATH -type f -mtime +$DAYS -exec rm -f {} +

echo "Cleanup complete. Old deployments and logs older than $DAYS days have been removed."
