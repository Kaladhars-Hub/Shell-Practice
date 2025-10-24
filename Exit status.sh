#!/bin/bash

ls /etc/hosts #This file exists
echo $? #Prints 0 (Success)

ls /not/a/real/file #This file doesnt exists
echo $? #Prints Non Zero number

#WE use this to control your script.the IF statement actually just checks the exit status.

if [[ -f "/etc/hosts" ]]; then echo "File exists"; fi

## You can use this to stop your script on failure
cp sensitive.txt /backup/
if [ $? -ne 0 ]; then
  echo "FATAL: Backup failed! Stopping script."
  exit 1 # Exit your *own* script with a "failure" score
fi
