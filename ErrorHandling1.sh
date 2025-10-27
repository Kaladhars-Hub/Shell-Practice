#!/bin/bash
set -euo pipefail

# Define a function to run on exit
cleanup() {
  echo "Cleaning up temp file..."
  rm -f /tmp/my_temp_file.txt
}

# Tell the script: "When you EXIT (for any reason), run the 'cleanup' function"
trap cleanup EXIT

echo "Creating temp file..."
touch /tmp/my_temp_file.txt

echo "Doing work..."
ls /not/a/real/file # This will fail (due to set -e)

echo "This line will never be reached"