#!/bin/bash

INPUTFILE=$1
OUTPUTFILE="filtered_errors.log"


if [[ ! -f "$INPUTFILE" ]]; then
    echo "file not exist"
    exit 1
fi

echo "TIMESTAMP, LOG_LEVEL, MESSAGE" > "$OUTPUTFILE"

grep "ERROR" "$INPUTFILE" >> "$OUTPUTFILE"

echo "Done filtering check $OUTPUTFILE"
