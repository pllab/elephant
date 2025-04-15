#!/bin/bash

# Check if the correct format is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <jpg|png>"
    exit 1
fi

# Set the desired format (jpg or png)
FORMAT=$1

if [[ "$FORMAT" != "jpg" && "$FORMAT" != "png" ]]; then
    echo "Error: Format must be 'jpg' or 'png'."
    exit 1
fi

# Change to the 'test' directory
cd tests || { echo "Error: directory not found."; exit 1; }
for file in *.svg; do
    if [[ -f "$file" ]]; then
        # Get the filename without the extension
        filename="${file%.*}"
        
        # Use rsvg-convert for better rendering
        rsvg-convert "$file" -f $FORMAT -o "../output-egraphs/${filename}.${FORMAT}"
        
        # Check if the conversion was successful
        if [[ $? -eq 0 ]]; then
            # Remove the original SVG file
            rm "$file"
        fi
    fi
done
