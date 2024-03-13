#!/bin/bash

# Define the directory whose disk usage we want to calculate
echo "Enter your desired directory"
read -p "directory : " file_path
echo "The current directory is" $file_path

# calculate the disk usage
du -h --max-depth=1 "$file_path" | sort -rh > disk_usage.txt
echo "File sorting completed."
echo "    "
echo "    "
echo "*************************************************************"
cat disk_usage.txt
