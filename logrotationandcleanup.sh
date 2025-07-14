#!/bin/bash

# Define the log directory
LOG_DIR="/var/log/myapp"
MAX_AGE=30 # Delete logs older than 30 days

# Compress logs that are older than 7 days
find $LOG_DIR -type f -name "*.log" -mtime +7 -exec gzip {} \;

# Remove logs older than 30 days
find $LOG_DIR -type f -name "*.log.gz" -mtime +$MAX_AGE -exec rm {} \;

echo "Log rotation completed successfully"
