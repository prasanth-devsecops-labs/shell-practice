#!/bin/bash

FILE=$1

if [[ ! -f $FILE ]]; then
    echo " file $FILE not found "
    exit 1
fi

cat "$FILE" | \
    tr -c '[:alnum:]' '[\n*]' | \
    tr '[:upper:]' '[:lower:]' | \
    grep -v '^$' | \
    sort | \
    uniq -c | \
    sort -rn | \
    head -5
