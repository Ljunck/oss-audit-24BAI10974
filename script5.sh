#!/bin/bash

echo "======================================"
echo "     Open Source Manifesto Maker      "
echo "======================================"
echo ""

read -p "Name one open-source tool you use: " tool
read -p "What does freedom mean to you (one word): " freedom
read -p "What would you like to build and share: " build

date_now=$(date "+%d %B %Y")
file="manifesto.txt"

echo "" > $file

echo "On $date_now, I believe that open source is about $freedom." >> $file
echo "Tools like $tool help people learn and grow together." >> $file
echo "In the future, I want to build $build and share it freely." >> $file
echo "Knowledge should be open and accessible to everyone." >> $file

echo ""
echo "Your manifesto has been saved to $file"
echo ""

cat $file

echo ""
echo "======================================"
