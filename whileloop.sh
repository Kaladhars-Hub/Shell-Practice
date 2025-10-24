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