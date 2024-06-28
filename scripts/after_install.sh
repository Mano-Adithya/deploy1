#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status
set -u  # Treat unset variables as an error and exit immediately
set -o pipefail  # Return the exit status of the last command in the pipe that failed

# Navigate to the application directory
cd /var/www/myapp

# Install npm dependencies
if [ -f package.json ]; then
  npm install
  echo "npm install completed"
else
  echo "package.json not found, npm install skipped"
fi
