#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(basename "$0" | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" #This means /var/log/shell-script/20-logs.log

mkdir -p "$LOGS_FOLDER"
echo "Script started at: $(date)" | tee -a "$LOG_FILE"

SOURCE_DIR=/home/ec2-user/app-logs

# Check if the directory exists
if [! -d $SOURCE_DIR ]; then
   echo -e "ERROR:: $SOURCE_DIR does not exist"
   exit 1
fi

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -type f -mtime +14)

# Read the file line by line
while IFS= read -r line
do
    echo "Deleting the file: $filepath"
    rm -rf $filepath
    echo "Deleted the file: $filepath
done <<< "$FILES_TO_DELETE"

#1.Delete Old Logs

#Concept: Remove log files older than 14 days to save disk space
#Command: find /var/log/roboshop-logs -name "*.log" -mtime +14 -delete
#Script Created: 01-delete-old-logs.sh
#Key Points:

#Check if directory exists
#Find .log files only
#Check age (older than 14 days)
#Log what will be deleted
#Then delete


#2.Find Command
#find <where-to-find> -name "*.log" -mtime +14

#What it does: Searches for files
#Options:

# -name "*.log" - Find only .log files
# -mtime +14 - Modified more than 14 days ago
# -type f - Files only (not directories)
# -delete - Delete found files

#3.While Loop

#Used for: Repeating tasks until condition is false
#Example Use Cases:

#Wait for service to start
#Process each file in a list
#Retry failed operations