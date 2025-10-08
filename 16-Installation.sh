!#/bin/bash

USERID=$(id -u)

if [$USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root privelage"
fi

dnf install mysql -y

if [$? -ne 0 ]; then
    echo "ERROR:: Installing Mysql is failure"
else
    echo "Installing Mysql is SUCCESS"
fi    
