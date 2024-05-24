#!/bin/bash
# Exit immediately if a command exits with a non-zero status
set -e

# Create the directory if it does not exist
mkdir -p /var/www/html

# Set the permissions for the directory
chmod -R 755 /var/www/html

# (Optional) Change the ownership to the web server user and group, e.g., apache
chown -R apache:apache /var/www/html

# (Optional) Move your application files to the directory
# cp -r /opt/codedeploy-agent/deployment-root/deployment-archive/* /var/www/html/
