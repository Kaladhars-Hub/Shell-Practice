#!/bin/bash

# Count from 1 to 3
count=1
echo "Counting up:"
while [ $count -le 3 ]; do
    echo "Count: $count"
    count=$((count + 1))
done