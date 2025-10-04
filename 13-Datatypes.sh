#!/bin/bash

# String variables
first_name="John"
last_name='Doe'

# String concatenation
full_name="$first_name $last_name"
echo "Full name: $full_name"

# String length
echo "Length: ${#full_name}"

# Substring (extract part of string)
text="Hello World"
echo "${text:0:5}"    # Output: Hello
echo "${text:6}"      # Output: World

# String replacement
sentence="I love cats"
echo "${sentence/cats/dogs}"  # Output: I love dogs