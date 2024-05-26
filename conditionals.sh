#!/bin/bash

#This  prints the sum of even numbers in an unsorted string
#check if the input has the expected variable

if [ -z "$1" ]; then
  echo 0
  exit 0
fi

IFS=',' read -ra numbers <<< "$1"
sums=0


for num in "${numbers[@]}"; do
    if [ $((num % 2)) -eq 0 ]; then
        sums=$((sums + num))
    fi
done

echo $sums

