#!/bin/bash

echo "======================================"
echo "      Directory Audit Report          "
echo "======================================"
echo ""

dirs=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "Checking important system folders..."
echo ""

for d in "${dirs[@]}"
do
    if [ -d "$d" ]
    then
        echo "Folder: $d"

        size=$(du -sh $d 2>/dev/null | cut -f1)
        info=$(ls -ld $d | awk '{print $1, $3, $4}')

        echo "Size: $size"
        echo "Permissions & Owner: $info"

        perm=$(ls -ld $d | awk '{print $1}')

        if [[ "$perm" == *"w"* && "$perm" == *"o"* ]]
        then
            echo "This folder might be unsafe (world writable)"
        else
            echo "Permissions look okay"
        fi

        echo "------------------------------"
    else
        echo "$d not found"
        echo "------------------------------"
    fi
done

echo ""
echo "Checking Python location..."

p=$(which python3 2>/dev/null)

if [ -n "$p" ]
then
    echo "Python found at: $p"
    echo "Details: $(ls -l $p | awk '{print $1, $3, $4}')"
else
    echo "Python not found"
fi

echo ""
echo "======================================"
