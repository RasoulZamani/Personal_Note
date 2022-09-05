#!/bin/bash
# control flow example

# test of if _________________________________________
a=-1
if [ $a -gt 0 ];then 
	echo $a is positive
else
	echo $a is negative
fi # for end of if 

# test of while/until _________________________________
i=0
while [ $i -lt 10 ];do # or say until [ $i gt 10 ];do
	echo i:$i
	((i+=1))
done

# test of for __________________________________________

for i in {1..10..2};do # or for (( i=1 ; i<10; i+=2 ))
	echo fori:$i
done

# test of function_______________________________________

function hi_name {
	echo hi $1
}

hi_name Rasoul

function number_things {
	echo I am counting for you
	i=0
	for f in $@;do
		((i=i+1))
		echo $i:$f
	done
}
number_things $(ls)
