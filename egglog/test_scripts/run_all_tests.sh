#!/bin/bash

# Directory containing the test files
TEST_DIR="/Users/julian/Documents/UniTU/ArchLab/elephant_egglog/tests"
ERROR=false

# Loop through all files in the test directory
for file in "$TEST_DIR"/*; do
    # Check if the file does not start with an underscore
    if [[ $(basename "$file") != _* ]] && [[ $(basename "$file") != note.md ]]; then
        # Run the egglog command with the file and convert to svg, suppress output
        if egglog "$file" --to-svg > /dev/null 2>&1; then
            # Run the svg_conversion.sh script with png as an argument, suppress output
            if ./svg_conversion.sh png > /dev/null 2>&1; then
                echo "Success: $(basename "$file")"
            else
                echo "Error: $(basename "$file") during svg conversion"
                ERROR=true
            fi
        else
            echo "Error: $(basename "$file") during egglog execution"
            ERROR=true
        fi
    fi
done

if [ "$ERROR" = true ]; then
    echo ""
    echo "Not all tests ran successfully!"
else
    echo ""
    echo "All tests ran successfully!"
fi
