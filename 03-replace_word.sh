#!/bin/bash

SEACRHDIR="${1:-.}"

find "$SEACRHDIR" -type f -name "*.conf" -exec sed 's/sbin/SBIN/g' {} +

echo "success...."


for f in $(find $SEACRHDIR -type f -name "passwd"); do
    sed 's/sbin/SBIN/g' $f | diff -u "$f" - | diff-highlight
done