#!/bin/bash

# Use home directory log file
log_file="$HOME/my_backup.log"

echo "starting backup..." >> "$log_file"

log(){
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] - $1" >> "$log_file"
}

log "INFO: Script started."
log "WARN: Low disk space"
log "INFO: Script finished."

echo "Log created at: $log_file"