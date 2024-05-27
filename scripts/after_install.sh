#!/bin/bash

echo "Running after install tasks..."
# Add any necessary post-installation tasks here
sudo chown -R www-data:www-data /var/www/myapp
