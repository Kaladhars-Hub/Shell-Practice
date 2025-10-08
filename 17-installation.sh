#!/bin/bash

USERID=$(id -u)

if [ "$USERID" -ne 0 ]; then
    echo "ERROR:: Please run this script with root privilege"
    exit 1
fi

VALIDATE(){ #functions receive inputs through args just like shell script args
     if [ "$?" -ne 0 ]; then
    echo "ERROR:: Installing Mysql is failure"
    exit 1
    else
    echo "Installing Mysql is SUCCESS"
    fi
}

dnf install mysql -y
VALIDATE $? "Mysql"

dnf install nginx -y
VALIDATE $? "nginx"

dnf install mongodb-mongosh -y
VALIDATE $? "mongodb-mongosh"

