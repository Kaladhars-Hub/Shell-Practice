#!/bin/bash

USERID=$(id -u)
 R="\e[31m"
 G="\e[32m"
 Y="\e[33m"
 N="\e[0m"

if [ "$USERID" -ne 0 ]; then
    echo "ERROR:: Please run this script with root privilege"
    exit 1 # failure is other than 0
fi

VALIDATE(){ #VALIDATE $? "Mysql" passes two arguments to the function
            #$1 = exit code $?
            #$2 = package name (mysql/nginix/mongodb)etc..
            #The function then uses these parameters to show appropriate messages
     if [ $1 -ne 0 ]; then
    echo -e "Installing $2 ... $R FAILURE $N"
    exit 1
    else
    echo -e "Installing $2 ... $G SUCCESS $N"
    fi
}

dnf list installed mysql -y
# Install if it is not found
if [$? -ne 0 ]; then
    dnf install mysql -y
VALIDATE $? "Mysql"
else
    echo -e "Mysql already exist ... $Y SKIPPING $N"
fi    

dnf list installed nginx -y
if [$? -ne 0 ]; then
    dnf install nginx -y
VALIDATE $? "nginx"
else
    echo -e "nginx already exist ... $Y SKIPPING $N"
fi    

dnf list installed python3 -y
if [$? -ne 0 ]; then
    dnf install python3 -y
VALIDATE $? "python3"
else
    echo -e "python3 already exist ... $Y SKIPPING $N"
fi





