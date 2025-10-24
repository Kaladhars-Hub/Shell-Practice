#!/bin/bash

ls /etc/hosts #This file exists
echo $? #Prints 0 (Success)

ls /not/a/real/file #This file doesnt exists
echo $?
