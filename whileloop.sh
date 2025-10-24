#!/bin/bash

# Keep asking until user says yes
answer=""
while [ "$answer" != "yes" ]; do
    echo "Are you ready? (yes/no)"
    read answer
done
echo "Great! Let's go!"