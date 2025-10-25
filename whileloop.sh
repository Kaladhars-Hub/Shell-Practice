#!/bin/bash

# Count from 1 to 3
count=1
echo "Counting up:"
while [ $count -le 3 ]; do
    echo "Count: $count"
    count=$((count + 1))
done

#!/bin/bash

# Simple password check
password=""
while [ "$password" != "hello" ]; do
    echo "Enter password:"
    read password #
done
echo "Access granted!"

#!/bin/bash

# Keep asking until user says yes
answer=""
while [ "$answer" != "yes" ]; do
    echo "Are you ready? (yes/no)"
    read answer
done
echo "Great! Let's go!"

#Advanced (Reading a file line-by-line): This is a super common and powerful pattern.

while IFS= read -r line; do
  echo "Read line: $line"
done < "/etc/hosts"

# Same file, different reading methods
echo "=== WRONG way (changes the text) ==="
while read name; do
    echo "Name: '$name'"
    touch name.txt
done < names.txt

echo "=== RIGHT way (keeps text exact) ==="
while IFS= read -r name; do
    echo "Name: '$name'"
    touch name.txt
done < names.txt

#Simple Rule:
#Always use while IFS= read -r line when reading files - it keeps the text exactly as it appears in the file!

# Even Simpler:
# read = "Read a line"

# The -r means: "If you see a backslash \, just keep it as a normal character"

#Example:

# File has: C:\Users\Name

# Without -r: Might try to interpret \U and \N as special codes

# With -r: Keeps it as C:\Users\Name


# IFS= = "Keep spaces where they are" or IFS= means: "Don't trim spaces from the beginning or end of lines"

# So: "Read each line exactly as written, don't change anything!"

