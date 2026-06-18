#!/bin/bash

# Print a message to indicate the start of the script
echo "Starting the application..."

# Navigate to the application directory
cd /var/www/myapp

# Start the application
pm2 delete all || true
pm2 start npm --name myapp -- start
pm2 save

# Print a message indicating that the application has started
echo "Application started successfully."
