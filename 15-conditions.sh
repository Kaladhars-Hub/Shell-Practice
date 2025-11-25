#!/bin/bash

#Comparison Operators:
#For Numbers

a=10
b=20

# Equal to represented by -eq and below is the example for it.
if [ $a -eq $b ]; then
    echo "Equal"
fi

# Not equal to represented by -ne and below is the example for it.
if [ $a -ne $b ]; then
    echo "Not equal"
fi

# Greater than represented by -gt and below is the example for it.
if [ $a -gt $b ]; then
    echo "a > b"
fi

# Less than represented by -lt and below is the example for it.
if [ $a -lt $b ]; then
    echo "a < b"
fi

# Greater than or equal represented by -ge and below is the example for it.
if [ $a -ge $b ]; then
    echo "a >= b"
fi

# Less than or equal represented by -le and below is the example for it.
if [ $a -le $b ]; then
    echo "a <= b"
fi
