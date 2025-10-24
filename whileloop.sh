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
    read password
done
echo "Access granted!"