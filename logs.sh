#!/bin/bash

log_file= "/var/log/my_backup.log"
echo "starting backup..." >> $log_file

#Advanced

#Create a logging function to make it cleaner and add a timestamps.

log_file=script.log
log(){
    #Append the message ($1) to the log file with a time stamp.

    echo[ $(date +'%Y-%m-%d%H:%M:%S')]-$1" >> $log_file
}
log "INFO:Script started."

# ...do work...

log "WARN:Low disk space"
log "INFO:Script finished."