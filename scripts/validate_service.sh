#!/bin/bash

# Example: Check if the application service is running
if systemctl is-active --quiet my-app; then
  echo "Service is running"
else
  echo "Service failed to start" >&2
  exit 1
fi
