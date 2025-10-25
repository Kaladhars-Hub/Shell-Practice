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
