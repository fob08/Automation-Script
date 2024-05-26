#Develop script that takes any string and calculate count of letters, numbers, symbols *!@#$%^&()_+ inside except whitespaces

#!/bin/bash
if [ -z "$1" ]; then
    echo 0
    exit 0
fi
input="$1"
Numbers=0
Symbols=0
Letters=0

for (( i=0; i<${#input}; i++ )); do
    char="${input:$i:1}"
    if [ "$char" != " " ]; then
        if [[ "$char" =~ [A-Za-z] ]]; then
            ((Letters++))
        elif [[ "$char" =~ [0-9] ]]; then
            ((Numbers++))
        else
            ((Symbols++))
        fi
    fi
done

echo "Numbers: $Numbers Symbols: $Symbols Letters: $Letters" 