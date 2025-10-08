#!/bin/bash

USERID=$(id -u)

if [$USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root privelage"
    exit 1 #failure is other than 0
fi

dnf install mysql -y

if [$? -ne 0 ]; then
    echo "ERROR:: Installing Mysql is failure"
    exit 1
else
    echo "Installing Mysql is SUCCESS"
fi    
