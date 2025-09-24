#!/bin/bash

echo "Enter Filename:"
echo
read filename

if [ -z "$filename" ]; then
    echo "Error: Filename cannot be empty"
    exit 1
fi

if [ -f "$filename" ]; then
    echo "File Exists"
else
	 echo "File Doesn't Exist"
fi
