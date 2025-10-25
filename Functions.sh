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
    local name=$2
    local name=$3
    echo "Hello, $name"
}

greet "person" "Barbie"
greet "person" "Harvey"
greet "person" "Superman"