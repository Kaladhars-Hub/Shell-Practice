#!/bin/bash

#Variables are labeled boxes where we store information (Ingredients)

#We Create a Variable by giving it a name and a value."No spaces around the = sign".

#Example:1

#Correct way of representing Variables.

name="Alice"
age=20

#Wrong way of representing Variables.
name = "Alice" #if we execute this command in terminal it will show as command not found,as it is wrong representation

#To get the value out of the box,we use the dollar sign "$" (Think of $ as "gimme the value").

#Example
echo "Hello, $name"
echo "you are $age years old"

#Advanced type in Variables:Quoting

#Double quotes:Use these most of the time,they let you use variables ($name) inside them.
#Single quotes:These are literally same as the literal text "$name" not the value "Alice".

#Command Substitution:Storing the o/p of a command in a variable.Use $(...).

#Example
current_date=$(date +%Y-%m-%d)
echo "Today is current_date"