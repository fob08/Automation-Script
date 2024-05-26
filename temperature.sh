#!/bin/bash

#This scripts converts degree celcius to kelvins and vice versa

if [ -z "$1" ]; then
    echo 0
    exit 0
fi


input_number=$1
number=${input_number%[CK]}
unit=${input_number: -1}


# Validate the extracted number
if ! [[ $number =~ ^-?[0-9]+$ ]]; then
    echo "Invalid input. Please provide a valid temperature in the format <value>C or <value>K."
    exit 1
fi

if [[ $unit == "K" ]]; then
    output=$((number - 273))C
elif [[ $unit == "C" ]]; then
    output=$((number + 273))K
else
    echo "invalid input, please provide a correct input"
    exit 1
fi

echo $output