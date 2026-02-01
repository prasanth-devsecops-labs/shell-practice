#!/bin/bash

SEACRHDIR="${1:-.}"

find "$SEACRHDIR" -type f -name "*.conf" -exec sed 's/sbin/SBIN/g' {} +

echo "success...."