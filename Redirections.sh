#!/bin/bash

ls /etc/hosts /nonexistent_file > output.txt 2> /dev/null
