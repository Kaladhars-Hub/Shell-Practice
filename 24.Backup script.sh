#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #if not provided considered as 14 days

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(basename "$0" | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" #This means /var/log/shell-script/20-logs.log

mkdir -p "$LOGS_FOLDER"
echo "Script started at: $(date)" | tee -a "$LOG_FILE"

if [ "$USERID" -ne 0 ]; then
    echo -e "${R}ERROR:: Please run this script with root privilege${N}" | tee -a "$LOG_FILE"
    exit 1
fi

    USAGE(){
         echo -e "$R USAGE:: sudo sh 24.Backup script.sh <SOURCE_DIR> <DEST_DIR> <DAYS>$N"
    }

#Check SOURCE_DIR and DEST_DIR passed or not ####    
if [ $# -lt 2 ]; then
    USAGE
fi

###Check SOURCE_DIR Exist ###
if [ ! -d $SOURCE_DIR ]; then
    echo -e "$R Destination $SOURCE_DIR does not exist $N"
    exit1
fi

###Check DEST_DIR Exist ###
if [ ! -d $DEST_DIR ]; then
    echo -e "$R Destination $SDEST_DIR does not exist $N"
    exit1
fi

### Find the files ###
FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

if [ ! -z "${FILES}" ]; then
    ### Start Archeiving ###
    echo "Files found"
    TIMESTAMP=$(date +%F-%H-%M)
    ZIP_FILE_NAME=$DEST_DIR/app-logs-$TIMESTAMP.zip"
    echo "Zip file name: $ZIP_FILE_NAME"
    find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS | zip -@ -j "$ZIP_FILE_NAME"
else

    ### Check Archeival Success or not ### 
    if [ -f $ZIP_FILE_NAME ]
then
    echo -e "Archeival ... $G SUCCESS $N"

    ### Delete if success ###
    while IFS= read -r line
do
    echo "Deleting the file: $filepath"
    rm -rf $filepath
    echo "Deleted the file: $filepath
done <<< $FILES
    else
        echo "Archieval ... $R FAILURE $N"
        exit1
    fi    
else        
    echo -e "No files to archieve ... $Y SKIP"
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