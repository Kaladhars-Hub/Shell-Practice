#!/bin/bash

greet () {
    echo "Hello,world"
}
greet

#Advanced Example

greet () {
    local name=$1
    echo "Hello,world"
}
greet_person "Barbie"
greet_person "Harvey"