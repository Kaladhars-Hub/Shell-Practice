#!/bin/bash

greet () {
    echo "Hello,world!"
}
greet
greet
#output

# Hello,world!
# Hello,world!

#Advanced Example

greet () {
    local person_type=$1
    local name=$2 $3
    echo "Hello, $name"
}

greet "person" "Barbie"
greet "person" "Harvey"
greet "person" "Superman"

#Output

# Hello, Barbie
# Hello, Harvey
# Hello, Superman

#Example:

greet () {
    # Skip the first argument "person" and use all others
    shift
    echo "Hello, $@" #@ means to use all arguments
}

greet "person" "Barbie"
greet "person" "Harvey"
greet "person" "Superman"

#Output

# Hello, Barbie
# Hello, Harvey
# Hello, Superman