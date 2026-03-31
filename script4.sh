#!/bin/bash

file=$1
word=${2:-error}

echo "======================================"
echo "        Log File Analyzer             "
echo "======================================"
echo ""

if [ ! -f "$file" ]
then
    echo "File not found"
    echo "Usage: ./script4.sh <logfile> [keyword]"
    exit 1
fi

echo "File: $file"
echo "Searching for: $word"
echo ""

count=0

while IFS= read -r line
do
    if echo "$line" | grep -iq "$word"
    then
        count=$((count+1))
    fi
done < "$file"

echo "Total matches: $count"
echo ""

echo "Last few matching lines:"
grep -i "$word" "$file" | tail -n 5

echo ""
echo "======================================"
