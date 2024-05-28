#!/bin/bash

if [ $# == 0 ]; then
  echo "This requires more input"
  exit 1
fi

input_number=$1
array=({a..z})

if [[ "${input_number}" -gt 26 ]]; then
  echo "The number provided is out of range. It should be within 1 and 26"
fi

for (( i=0; i<input_number; i++ )); do
  folder_name="folder_${array[i]}"
  mkdir "$folder_name"
  echo  "$folder_name"
done
  
