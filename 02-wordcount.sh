#!/bin/bash

FILE=$1

if [ -z $FILE ]; then
    echo "Provide file"
    exit 1
fi

if [ ! -e $FILE ]; then
    echo "not a file"
    exit 1
fi

if [ ! -r $FILE ]; then
    echo "no read access"
    exit 1
fi

if [ ! -s $FILE ]; then
    echo "file is empty"
    exit 0
fi

read lines words chars rest < <(wc "$FILE")

echo "Lines : $lines"
echo "Words : $words"
echo "chars : $chars"

echo "resr  : $rest"
