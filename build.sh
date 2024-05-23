#!/bin/bash

# Clean up previous build artifacts
rm -rf target/

# Build the project
mvn clean package

# Check if the build was successful
if [ $? -eq 0 ]; then
    echo "Build successful."
    # Copy the built artifact to the deployment directory
    cp target/myapp.jar /path/to/deployment/directory/
else
    echo "Build failed. Exiting."
    exit 1
fi
