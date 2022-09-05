#!/bin/bash 
# this will show time 

today=$(date +"%d-%m-%y")
time=$(date +"%H:%M:%S")

printf -v d "\nDate:\t%s @ %s\n"  $today $time
echo "$d"
