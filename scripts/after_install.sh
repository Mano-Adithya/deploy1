#!/bin/bash
set -e

# Log file path
LOG_FILE="/home/ubuntu/after_install.log"

# Function to log messages
log_message() {
    echo "$(date +"%Y-%m-%d %T"): $1" >> "$LOG_FILE"
}

# Log start of script
log_message "Starting After Install script"

# Additional setup tasks
# Example: Configure environment variables, install dependencies, etc.

# Log end of script
log_message "After Install script completed successfully"
