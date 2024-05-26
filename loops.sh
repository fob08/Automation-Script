#!/bin/bash

if [ $# -eq 0 ]; then
    echo "No argument provided. Usage: $0 <string>"
    exit 1
fi

input_file=$1
length=${#input_file}
output_string=""

for ((i=${length}-1; i>=0; i--)); do
    character="${input_file:$i:1}"

    if [[ $character == [A-Z] ]]; then
        output_string+=$(echo "$character" | tr 'A-Z' 'a-z')
    elif [[ $character == [a-z] ]]; then
        output_string+=$(echo "$character" | tr 'a-z' 'A-Z')
    else
        output_string+="$character"
    fi
done

echo $output_string
