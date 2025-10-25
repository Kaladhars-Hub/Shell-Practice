#!/bin/bash
# REDIRECTIONS CHEAT SHEET

echo "=== Redirections Summary ==="

# 1. BASIC REDIRECTIONS
echo "1. Basic Redirections:"
ls / > root_files.txt                    # Save output to file
echo "Log entry" >> script.log           # Append to file

# 2. ERROR HANDLING
echo -e "\n2. Error Handling:"
ls /real_file /fake_file 2> errors.txt   # Save errors to file
ls /fake_file 2> /dev/null               # Discard errors completely

# 3. COMBINE OUTPUT & ERRORS
echo -e "\n3. Combine Output & Errors:"
ls /real_file /fake_file > output.txt 2>&1    # Both to same file
ls /real_file /fake_file 2>&1 | grep "file"   # Both to pipe

# 4. PRACTICAL EXAMPLES
echo -e "\n4. Practical Examples:"
# Save both output and errors to log
ls /etc/hosts /fake_file > full_log.txt 2>&1

# Silent operation (no output/errors shown)
ls /fake_file > /dev/null 2>&1

echo "Redirections practice completed!"

# 2> /dev/null = Black hole - errors disappear forever

# 2> filename = Notebook - errors are written to a file you can read later