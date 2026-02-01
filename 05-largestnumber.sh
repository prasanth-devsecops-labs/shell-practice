#!/bin/bash

# largest number from command line args

if [[ $# -eq 0 ]]; then
    echo "please provide args to script"
    exit 1
fi

max=$1

for num in $@; do
    if (( num > max )); then
        max=$num
    fi
done

echo "largest number is : $max"
