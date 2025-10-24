#!/bin/bash

ls /etc/hosts #This file exists
echo $? #Prints 0 (Success)

ls /not/a/real/file #This file doesnt exists
echo $? #Prints Non Zero number

#WE use this to control your script.the IF statement actually just checks the exit status.

if [[ -f "/etc/hosts"]] then ... fi
