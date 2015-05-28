#!/bin/sh

echo "\nCopying...\n"

cd ~/Code/GitHub/

rm -rf org/*

cp -r ~/Code/Ruby/org/ ~/Code/GitHub/org/

cd ~/Code/GitHub/org

echo "Committing...\n"

git add -A

git commit -m "$1"

git push

echo "\n"
