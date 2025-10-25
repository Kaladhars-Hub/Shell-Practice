#!/bin/bash


#WITH 2>&1:

# Both output AND errors go to file (nothing on screen)
ls /existing_file /nonexistent_file > output.txt 2>&1
# Everything is silent - all in output.txt
