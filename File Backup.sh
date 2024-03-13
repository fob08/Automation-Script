#!/bin/bash

# Define the directory whose disk usage we want to calculate
echo "Enter your desired directory"
read -p "directory : " file_path
echo "The current directory is" $file_path
sleep 5
echo "Enter your backup directory path"
read -p "backup_path : " backup_path
sleep 5
echo "The backup path is " $backup_path
if [ -d "$backup_path" ]
then
	continue
else
	mkdir $backup_path
fi

# create a file backup
scp -r $file_path $backup_path
sleep 5
echo "*****************"
echo "File Backup successfully created."
echo "    "
echo "****************"
ls $backup_path
