#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # If not provided, defaults to 14 days

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(basename "$0" | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" 

mkdir -p "$LOGS_FOLDER"
echo "Script started at: $(date)" | tee -a "$LOG_FILE"

if [ "$USERID" -ne 0 ]; then
    echo -e "${R}ERROR:: Please run this script with root privilege${N}" | tee -a "$LOG_FILE"
    exit 1
fi

USAGE(){
    echo -e "$R USAGE:: sudo sh 24.Backup script.sh <SOURCE_DIR> <DEST_DIR> <DAYS> $N"
    exit 1
}

# 1. Check if SOURCE_DIR and DEST_DIR are provided
if [ $# -lt 2 ]; then
    USAGE
fi

# 2. Check if SOURCE_DIR Exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo -e "$R Source directory $SOURCE_DIR does not exist $N"
    exit 1
fi

# 3. Check if DEST_DIR Exists
if [ ! -d "$DEST_DIR" ]; then
    echo -e "$R Destination directory $DEST_DIR does not exist $N"
    exit 1
fi

# 4. Find the files
echo "Finding files in $SOURCE_DIR older than $DAYS days..."
FILES=$(find "$SOURCE_DIR" -name "*.log" -type f -mtime +$DAYS)

# 5. Check if FILES is not empty
if [ ! -z "$FILES" ]; then
    echo "Files found. Starting Archive..."
    
    TIMESTAMP=$(date +%F-%H-%M)
    ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIMESTAMP.zip" # Fixed quote issue here
    
    # Create the Zip file
    # We use 'find' again piping to zip to handle the list cleanly
    find "$SOURCE_DIR" -name "*.log" -type f -mtime +$DAYS | zip -@ -j "$ZIP_FILE_NAME"

    # 6. Check if Zip creation was successful
    if [ -f "$ZIP_FILE_NAME" ]; then
        echo -e "Archival ... $G SUCCESS $N"
        
        # 7. Delete original files
        echo "Deleting original log files..."
        
        while IFS= read -r filepath
        do
            echo "Deleting file: $filepath"
            rm -rf "$filepath"
        done <<< "$FILES"
        
        echo -e "Cleanup ... $G COMPLETED $N"
        
    else
        echo -e "Archival ... $R FAILURE $N"
        exit 1
    fi

else
    echo -e "No old log files found to archive ... $Y SKIP $N"
fi

#Purpose of Backup Script: Archive old logs, move to backup location, then delete originals
#Script Created: 02-backup-logs.sh

#Features:

#Accept 2-3 arguments: source_dir, dest_dir, days (optional)
#Check if directories exist
#Find old .log files
#Zip them with timestamp
#Move to destination
#Delete originals only if zip succeeds
#Install zip command if missing (learned from PROD failure!)

#Usage:
#bashsh backup.sh /var/log/roboshop-logs /backups 14