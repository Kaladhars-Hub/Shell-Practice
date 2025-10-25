#!/bin/bash

#Example:
ls / > root_files.txt

#Example:
echo "Script ran at $(date)" >> script.log
echo "Im learning Redirections" >> script.log

echo "Im learning errors in redirections"

# Create actual errors and hide them
ls /file_that_does_not_exist 2> error_output.txt
cat /another_fake_file 2>> error_output.txt

echo "Check the hidden errors:"

cat error_output.txt #To check the ouput files of error

# Redirect stderr (2) to stdout (1)
command 2>&1

# Both normal output and errors go to the same file
command > output.txt 2>&1

# Errors and normal output both show on screen
ls /existing_file /nonexistent_file 2>&1

# Both normal output and errors go to grep
ls /existing_file /nonexistent_file 2>&1 | grep "file"
