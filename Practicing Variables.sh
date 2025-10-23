#!/bin/bash

# Understanding variables and paths
home_dir="$HOME"
echo "Home directory: $home_dir"

filename="report.txt"
echo "Original filename: $filename"

# String manipulation
name_without_extension="${filename%.txt}"
echo "Without extension: $name_without_extension"

backup_filename="${filename%.txt}_backup.txt"
echo "Backup filename: $backup_filename"

# Create directories and files
documents_dir="$HOME/Documents"
backup_dir="$HOME/backup"

mkdir -p "$documents_dir" "$backup_dir"

# Create original file
echo "This is the original report" > "$documents_dir/report.txt"

# Copy with modified name
cp "$documents_dir/report.txt" "$backup_dir/$backup_filename"

echo "Files created:"
echo "Original: $documents_dir/report.txt"
echo "Backup: $backup_dir/$backup_filename"

# Verify files
echo "--- Original file content ---"
cat "$documents_dir/report.txt"

echo "--- Backup file content ---" 
cat "$backup_dir/$backup_filename"