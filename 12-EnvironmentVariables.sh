#!/bin/bash

# System environment variables
echo "Your username: $USER"
echo "Your home: $HOME"
echo "Your shell: $SHELL"
echo "Current path: $PATH"

# Export variable (available to child processes)
export MY_VAR="Hello"
