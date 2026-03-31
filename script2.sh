#!/bin/bash

pkg="python3"

echo "======================================"
echo "      Python Installation Check       "
echo "======================================"
echo ""

echo "Checking if Python is installed..."
echo ""

if command -v $pkg > /dev/null
then
    echo "Python is installed"

    ver=$($pkg --version 2>&1)
    path=$(which $pkg)

    echo "Version: $ver"
    echo "Location: $path"

else
    echo "Python is not installed"
    echo "You can install it using:"
    echo "sudo apt install python3"
fi

echo ""
echo "------ Some Package Info ------"

if command -v dpkg > /dev/null
then
    dpkg -l | grep python3 | head -n 3
else
    echo "Package manager info not available"
fi

echo ""
echo "------ About this Software ------"

case $pkg in
    python3)
        echo "Python is a simple and powerful language used in many fields like AI, web and automation"
        ;;
    git)
        echo "Git is used to manage code versions"
        ;;
    vlc)
        echo "VLC is a media player for many formats"
        ;;
    *)
        echo "General open source software"
        ;;
esac

echo ""
echo "======================================"
