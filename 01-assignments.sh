#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

TARGET=$1

if [ -z $TARGET ]; then
    ehco "usage $0 <file/directory>"
    exit 1
fi

if [ -e $TARGET ]; then
    echo "file path exists"

    [ -r $TARGET ] && echo "readable" || echo "not readable"
    [ -w $TARGET ] && echo "writable" || echo "not writable"

    if [ -d $ $TARGET ]; then
        echo "this is directory listing contents"
        ls -F $TARGET
    fi
else
    echo "path not present"
fi

