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
    local name=$1
    local name=$2
    echo "Hello, $name"
}

greet  "Barbie"
greet  "Harvey"