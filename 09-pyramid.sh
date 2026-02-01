#!/bin/bash

ROWS=5

for (( i=1; i<=ROWS; i++ ))
do
    # 1. Print leading spaces
    for (( j=i; j<ROWS; j++ ))
    do
        echo -n " "
    done

    # 2. Print stars (2*i - 1 formula creates the pyramid shape)
    for (( k=1; k<=(2*i - 1); k++ ))
    do
        echo -n "*"
    done

    # 3. Move to the next line
    echo ""
done
