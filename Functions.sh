#!/bin/bash

#Advanced Example

greet () {
    local person_type=$1
    local name=$2
    echo "Hello, $name"
}

greet "person" "Barbie"
greet "person" "Harvey"