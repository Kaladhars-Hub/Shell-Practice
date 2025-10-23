#!/bin/bash

#Practice 1

name="John Doe"
age=25
city="New York"
country="USA"

echo "User Information:"
echo "Name: $name"
echo "Age: $age"
echo "Location: $city, $country"
echo "Full introduction: Hello, I'm $name, $age years old from $city, $country."

#Practice 2

# Directory and file variables
home_dir="$HOME"
documents_dir="$home_dir/Documents"
backup_dir="$home_dir/backup"
filename="report.txt"
full_path="$documents_dir/$filename"

# Using variables for file operations
echo "Home directory: $home_dir"
echo "Documents directory: $documents_dir"
echo "File to process: $full_path"

# Create backup directory if it doesn't exist
mkdir -p "$backup_dir"

# Copy file using variables
cp "$full_path" "$backup_dir/${filename%.txt}_backup.txt"
echo "Backup created in: $backup_dir"