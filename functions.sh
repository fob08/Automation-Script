#!/bin/bash

pow() {
    result=1
    for ((i=0; i<$2; i++)); do
        result=$((result * $1))
    done
    echo $result
}


shortest() {
    shortest_length=${#1}
    shortest_strings="$1"
    
    for arg in "$@"; do
        if [ ${#arg} -lt $shortest_length ]; then
            shortest_length=${#arg}
            shortest_strings="$arg"
        elif [ ${#arg} -eq $shortest_length ] && ! grep -qxF "$arg" <<< "$shortest_strings"; then
            shortest_strings="$shortest_strings"$'\n'"$arg"
        fi
    done
    
    echo "$shortest_strings"
}




print_log() {
    current_time=$(date +"[%Y-%m-%d %H:%M]")
    echo "$current_time $1"
}
