#!/bin/bash

name="Aditya Mishra"
roll="24BAI10974"
project="Python"

echo "======================================"
echo "        System Identity Report        "
echo "======================================"
echo ""

echo "Student: $name"
echo "Roll No: $roll"
echo "Project: $project"
echo ""

echo "------ Basic System Info ------"
echo "User: $(whoami)"
echo "Home Directory: $HOME"
echo "Hostname: $(hostname)"
echo ""

echo "OS: $(uname -o)"
echo "Kernel Version: $(uname -r)"
echo "Architecture: $(uname -m)"
echo ""

echo "------ Time Info ------"
echo "Date: $(date +%d-%m-%Y)"
echo "Time: $(date +%H:%M:%S)"
echo "Uptime: $(uptime -p)"
echo ""

echo "------ Storage Info ------"
disk=$(df -h / | awk 'NR==2 {print $5}')
echo "Disk Usage: $disk"

mem=$(free -h | awk 'NR==2 {print $3 "/" $2}')
echo "Memory Usage: $mem"
echo ""

echo "------ Simple Check ------"
d=$(echo $disk | tr -d '%')

if [ "$d" -gt 80 ]
then
    echo "Disk usage is high, better to clean space"
else
    echo "Disk usage is normal"
fi

echo ""
echo "This system uses open source software (GPL based)"
echo "======================================"
