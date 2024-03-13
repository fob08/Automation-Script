#!/bin/bash

# Define the directory containing the files to be sorted
echo "Input directory to be classified based on file extension"
read -p "File_path: " directory
echo "Your inputed directory is $directory"

# Create a sorted directory if it doesn't exist
sorted_directory="${directory}/sorted_files"
mkdir -p "${sorted_directory}"

# Loop through each file in the directory
for file in "${directory}"/*; do
	#Skip directories
	if [ -d "$file" ]; then
		continue
	fi

	#Extract the extension of the file
	extension="${file##*.}"

	# Create a directory for the extension if it doesn't exist
	extension_directory="${sorted_directory}/${extension}"
	mkdir -p "${extension_directory}"

	#Move the file to the corresonding extension directory
	mv "${file}" "${extension_directory}"
	echo "Moved ${file} to ${extension_directory}"

done

echo "File sorting completed."

