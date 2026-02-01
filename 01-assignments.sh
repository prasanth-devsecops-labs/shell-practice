#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

TARGET=$1

if [ -z $TARGET ]; then
    ehco "usage $0 <file/directory>"
    exit 1
fi

if [ -e $TARGET ]; then
    echo "file path exists"

    # similar to if else: ||cmd executes only if left side cmd fails
    [ -r $TARGET ] && echo "readable" || echo "not readable" 
    [ -w $TARGET ] && echo "writable" || echo "not writable"

    if [ -d $TARGET ]; then
        echo "this is directory listing contents"
        ls -F $TARGET
    fi
else
    echo "path not present"
fi


# Operator	Function	     Plain English
# -z	String is empty	     "Is this variable blank?"
# -n	String is not empty	 "Does this variable have text in it?"
# -e	Path exists	         "Does this file or folder exist at all?"
# -r	Readable	        "Do I have permission to read it?"
# -w	Writable	        "Do I have permission to change it?"
# -d	Directory	        "Is this a folder (not a file)?"

# Here are the most common Bash file test operators you'll encounter in professional scripts:
# -f (Is a File) :    Checks if the target is a regular file (not a directory or a device). This is safer than -e if you specifically need to cat or grep something.
# -x (Executable):    Checks if the file can be executed as a program/script.
# -s (Not Empty) :    Checks if the file exists and has a size greater than zero. Great for checking if a log file actually contains data.
# -L (Symbolic Link): Checks if the file is a symbolic link (a shortcut pointing elsewhere).
# -nt (Newer Than)  : Compares two files. file1 -nt file2 is true if file1 was modified more recently.
# -h (Hard Link)    : Checks for hard links (though -L is used more frequently for general "link" checks).

