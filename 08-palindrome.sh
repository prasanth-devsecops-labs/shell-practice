#!/biin/bash

INPUT=$1

if [[ -z $INPUT ]]; then
    echo "emplty inputs"
    exit 1
fi

REVERSED=$(echo -n "$INPUT" | rev)

if [[ "$INPUT" == "$REVERSED" ]]; then
    echo "YES"
else
    echo "NO"
fi


