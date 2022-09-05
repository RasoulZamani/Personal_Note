#!/bin/bash
# get info from user

echo what is your name?
read name

echo Enter your pass?
read -s pass

read -p" what is your favarit animal?" animal

read -p "how old are you? [dd]" age
while [[ ! $age =~ [0-9]{2} ]]; do
	read -p "Age number like 26 pls!" age
done

select color in "white" "green" "red" "blue" "black"
do
	echo you selected $color
	break
done

echo name: $name, pass:$pass, f_animal: $animal, age:$age, color:$color


