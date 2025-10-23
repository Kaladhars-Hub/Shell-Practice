#!/bin/bash

#Example 3:Calculator with user i/p

# Get user input
echo "Enter first number:"
read num1
echo "Enter second number:"
read num2
echo "Enter operation (+, -, *, /):"
read operation

# Perform calculation
case $operation in
    "+")
        result=$((num1 + num2))
        ;;
    "-")
        result=$((num1 - num2))
        ;;
    "*")
        result=$((num1 * num2))
        ;;
    "/")
        if [ $num2 -ne 0 ]; then
            result=$((num1 / num2))
        else
            result="Error: Division by zero"
        fi
        ;;
    *)
        result="Invalid operation"
        ;;
esac

# Display result
echo "Result: $num1 $operation $num2 = $result"
