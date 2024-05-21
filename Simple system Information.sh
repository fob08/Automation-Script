#!/bin/bash

echo " " > info.txt
echo " " >> info.txt
echo "Kernel Version" >> info.txt
uname -srv >> info.txt
echo " " >> info.txt
echo " " >> info.txt

echo "Host Details" >> info.txt
hostnamectl >> info.txt
echo " " >> info.txt

echo "CPU Information" >> info.txt
lshw -C CPU | head -7 >> info.txt
echo " " >> info.txt

echo "Available Memory" >> info.txt
free >> info.txt

cat info.txt
