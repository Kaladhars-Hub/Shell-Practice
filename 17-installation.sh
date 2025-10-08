#!/bin/bash

USERID=$(id -u)

if [ "$USERID" -ne 0 ]; then
    echo "ERROR:: Please run this script with root privilege"
    exit 1
fi

VALIDATE(){ #VALIDATE $? "Mysql" passes two arguments to the function
            #$1 = exit code $?
            #$2 = package name (mysql/nginix/mongodb)etc..
            #The function then uses these parameters to show appropriate messages
     if [ $1 -ne 0 ]; then
    echo "ERROR:: Installing $2 is failure"
    exit 1
    else
    echo "Installing $2 is SUCCESS"
    fi
}

dnf install mysql -y
VALIDATE $? "Mysql"

dnf install nginx -y
VALIDATE $? "nginx"

dnf install python3 -y
VALIDATE $? "python3"



