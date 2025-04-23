#!/bin/bash

# Get the directory of this script.
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

####################### VARIABLES USER CAN OVERRIDE ############################
# The egglog command to use.
EGGLOG=${EGGLOG:-egglog}
# SVG directory. Will be relative to the test directory.
SVG_DIR=${SVG_DIR:-$SCRIPT_DIR/svg}
################################################################################

# Exit on error.
set -e
# Exit on error in a pipeline.
set -o pipefail

# Exit routine.
cleanup_and_exit() {
    prev_return_code=$?

    # Cleanup files.
    rm -f $stdout_file $stderr_file

    cd $OLD_PWD

    code=${1:-$prev_return_code}
    exit $code
}
trap cleanup_and_exit EXIT

# Create the SVG directory if it doesn't exist.
if [ ! -d "$SVG_DIR" ]; then
    mkdir -p "$SVG_DIR"
fi

# Directory containing the test files
TESTS_DIR="$SCRIPT_DIR/tests"
ERROR=false

# Make sure we're running in the script dir if we're not there already. This is
# unfortunately needed because the include commands in egglog are relative to
# the current working directory.
OLD_PWD=$(pwd)
cd $SCRIPT_DIR
# Ensure elephant.egg is in the current directory.
if [ ! -f elephant.egg ]; then
    >&2 echo "elephant.egg not found in $SCRIPT_DIR"
    cleanup_and_exit 1
fi

# Check if the egglog command is available, error if it isn't. User can override
# the egglog command by setting the EGGLOG environment variable.
if ! command -v $EGGLOG 2>&1 >/dev/null
then
    >&2 echo "$EGGLOG could not be found. Please install egglog with `cargo install egglog`, or set the EGGLOG environment variable to the path of the egglog binary."
    cleanup_and_exit 1
fi
>&2 echo "egglog command: $EGGLOG"

# Loop through all files in the test directory
for file in "$TESTS_DIR"/*; do
    stdout_file=$(mktemp)
    stderr_file=$(mktemp)
    # Check if the file does not start with an underscore
    if [[ $(basename "$file") != _* ]] && [[ $(basename "$file") != note.md ]]; then
        # Run the egglog command with the file and convert to svg. Note: Deleted
        # the old svg_conversion.sh script that converted the SVG to PNG;
        # if needed, can be rewritten.
        if egglog "$file" --to-svg > $stdout_file 2> $stderr_file; then
            # Move the SVG file to the SVG directory.
            svg_file=${file%.egg}.svg
            if [ -f "$svg_file" ]; then
                mv "$svg_file" "$SVG_DIR"
                >&2 echo "Success: $(basename "$file")"
            else
                >&2 echo "Error: $(basename "$file") did not produce an SVG file"
                ERROR=true
            fi

        else
            >&2 echo "Error: $(basename "$file") during egglog execution"
            >&2 echo 
            >&2 echo "stdout:"
            >&2 cat $stdout_file
            >&2 echo 
            >&2 echo "stderr:"
            >&2 cat $stderr_file

            ERROR=true
        fi
    fi
done

if [ "$ERROR" = true ]; then
    >&2 echo "Some tests failed. Check the output above for details."
    cleanup_and_exit 1
else
    >&2 echo "All tests passed successfully."
    cleanup_and_exit 0
fi
