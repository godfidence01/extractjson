#!/bin/bash

# Check if jq is installed
if ! command -v jq &> /dev/null; then
    echo "jq is not installed. Please install it first."
    exit 1
fi

# Check if a JSON file is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <json_file>"
    exit 1
fi

json_file=$1

# Check if the file exists
if [ ! -f "$json_file" ]; then
    echo "Error: File $json_file not found."
    exit 1
fi

# Use jq to extract URLs from the JSON file
domain=$(jq -r '.. | .domain? // empty' "$json_file" | grep -v '^$')

# removing the blank spaces or new line
# Print the extract
echo "$domain"
