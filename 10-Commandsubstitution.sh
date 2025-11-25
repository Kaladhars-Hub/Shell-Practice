#!/bin/bash

# Store command output in variable
current_date=$(date)
user_count=$(who | wc -l)
files=$(ls)

echo "Today is: $current_date"
echo "Users logged in: $user_count"
echo "Files: $files"

# Old style (backticks) - avoid this
old_way=`date`
