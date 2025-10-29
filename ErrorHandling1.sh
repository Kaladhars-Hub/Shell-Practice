#!/bin/bash

set -euo pipefail
# Purpose: Enables strict error handling mode

# -e: Exit immediately if any command fails

# -u: Treat unset variables as errors

# -o pipefail: Pipeline fails if any command in the pipe fails

# Effect: Makes the script more robust and less error-prone

# Define a function to run on exit

cleanup() {
  echo "Cleaning up temp file..."
  rm -f /tmp/my_temp_file.txt
}

# Tell the script: "When you EXIT (for any reason), run the 'cleanup' function"

trap cleanup EXIT

# trap: Command to catch signals/events

# cleanup: The function to call

# EXIT: The signal/event to trap (script termination)

# Effect: No matter how the script ends (success, error, Ctrl+C), cleanup will run

echo "Creating temp file..."
touch /tmp/my_temp_file.txt

echo "Doing work..."
ls /not/a/real/file # This will fail (due to set -e)

echo "This line will never be reached"

# When you run the above script, it will print "Creating...", "Doing...", ls will fail, set -e will stop the script, the EXIT signal will be trapped, and it will run cleanup() before it dies.