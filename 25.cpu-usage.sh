#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=2 # Keeping it low for testing

# Loop through each line
while IFS= read -r line; do
    # Extract partition and usage
    PARTITION=$(echo "$line" | awk '{print $1}')
    USAGE=$(echo "$line" | awk '{print $6}' | cut -d'%' -f1)
    
    # Check threshold
    if [ "$USAGE" -ge $DISK_THRESHOLD ]; then
        # Send email alert (Fixed the quotes here)
        echo "High Usage on: $PARTITION Usage: $USAGE%"
    fi
done <<< "$DISK_USAGE"