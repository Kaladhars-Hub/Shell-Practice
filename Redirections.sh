#!/bin/bash

# Create a real file
touch test_existing_file.txt

# Now run the command
ls test_existing_file.txt /this_file_does_not_exist > output.txt 2> /dev/null

echo "Here's what got saved in output.txt:"
