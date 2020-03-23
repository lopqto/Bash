#!/bin/bash

args=("$@")

firstfile=${args[0]}
secondfile=${args[1]}

if [ ! -f "$firstfile" ] || [ ! -f "$secondfile" ]; then
    echo "one or two of the files missing"
    exit 1
fi

xxd "$firstfile" > "/tmp/$firstfile.hex"
xxd "$secondfile" > "/tmp/$secondfile.hex"

vimdiff "/tmp/$firstfile.hex" "/tmp/$secondfile.hex"