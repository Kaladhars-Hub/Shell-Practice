#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=2 # Keeping it low for testing
IP_ADDRESS=$(curl http://169.254.169.254/latest/meta-data/local-ipv4 )
MESSAGE=""
# Loop through each line
while IFS= read -r line; do
    # Extract partition and usage
    PARTITION=$(echo "$line" | awk '{print $1}')
    USAGE=$(echo "$line" | awk '{print $6}' | cut -d'%' -f1)
    
    # Check threshold
    if [ "$USAGE" -ge $DISK_THRESHOLD ]; then
        # Send email alert (Fixed the quotes here)
        MESSAGE+="High Usage on: $PARTITION Usage: $USAGE % \n" #escaping
    fi
done <<< "$DISK_USAGE"

echo -e "Message Body: $MESSAGE"