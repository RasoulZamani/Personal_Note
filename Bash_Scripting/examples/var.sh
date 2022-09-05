#!/bin/bash
# lets test variable

a1=hello
a2="this file ($0) is for test bash!" 
a3="address of file is: $PWD$0"
a4="by by!"

echo $a1 $a2  
echo $a3
echo "$a4"
echo $0 # filename
echo $SECONDS

echo
echo

# variables

a=2
r=$((a+1))#3
echo $r

((a--))  #1
((a*=3)) #3
exp=$((a**2)) #9
echo $exp

# float point
f=$(echo 1/3 | bc -l)
echo $f

# comparison
[[ "cat" == "dog" ]]
echo comparision result of cat==dog is $? 

[[ 100 -lt 1 ]]
echo "comparision result of 100<1 is $?" 

