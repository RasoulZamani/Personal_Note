# **BASH**
_____________________________________________
This file is summarize and some notes from:

Lynda.Learning.Bash.scripting course by Scott Simpson

also you can find some bash scripts in example folder.
it is some kind of personal note but it can be useful as a summarized tutorial of bash  
_____________________________________________
## Introdoction
BASH (Bourne Again Shell) is popular interactive command line interpreter
### command line
it is recommended to know basic command line like: ls, cd ,pwd, cat, mkdir,...

`ls -l | wc -l` -> trick for counting files
`some cmd' | more (or | less) ` -> better readability for long outputs
`grep --color=auto <sth for search> file_adress | awk {print $10}` -> searching in files and print 12th section of line seprated by space, for another seprator use `cut -d`

general advice: use `man <unknown>` for learning!

` echo $BASH_VERSION` -> show version of your bash
_____________________________________________
`echo {1..10..2}` -> 1,3,5,7,9
`echo {a..z}` -> a b c ...
creating multiple file:
`mkdir file_{1..10}`
for better sorting add 0 {01..9}
_____________________________________________
`ls > /dev/null ` -> replace ls stdout to file in /dev
`ls >> /dev/null ` -> add ls stdout to file in /dev

`cp -v * ../otherfoider 1>../success.txt 2>../error` 1,2 refer to stdout and stderr
_____________________________________________
bash usually refer to one camand in shell but bash **script** can contains: variable, argument, logic flow.Script should be started by hasbang+address of bash:
```
#!bin/bash
# coments
comands
```
dont forget **.sh** in end of filename of script.
after writing comands in script, we can run it by `bash file.sh` or first make your script executable by `chmod +x file.sh` then just type `./file.sh`
_____________________________________________
## Variables
use=without space, and then for echo use $ before var, e.g:
```
a1=hello
a3="by by!"  #when we have space use ""

echo $a1 $a3
echo "$a1 $a3"
#out put of both last command -> hello by by!
```
there is some Built-in variable such
$home -> address of home directory
$0 -> name of BASH
$SECONDS -> sec after running BASH

you can declare sth about variable, like:
```
declare -i a=2 # a is integer
declare -r a=2 # a is read only
declare -u a=a # a is A
```

also we can use () for storing result of command, for example this bash script can use for test ping:
```
#!/bin/bash
# this bash file for using ping
ping_result=$(ping -c 1 example.com | grep 'bytes from' |cut -d = -f 4)
echo "the ping was $ping_result"
```

for arithmetic operation use $((expression)):
```
a=2
r=$((a+1))#3
e=(a+1) #string:21
((a--))  #1
((a*=3)) #3
((a**2)) #9
echo $a

# for floating number use bc -l:
f=$(echo 1/3 | bc -l)
echo $f
```
for **comparison** use [[ expression ]] (notice to space between [ and exp ).
you can use
 < > == != <= >= for string
and
 -lt -gt -eq -ne -le -ge for numbers.
also there is logical tools:

| logic | symbole |
| ----- | ------- |
| and   |   &&    |
| or    |   \|\|  |  
| not   |   !     |
|is null|  -z     |
|notnull|  -n     |

It return 0 for True and 1 for False(!!). e.g:
```
[[ "cat == "cat" ]]
echo $? -> returns 0 (True)

[[ 100 -lt 1 ]]
echo $? -> 1 (False)
```
for **strings** you can easilly concatate them: `c=$a$b` and finding lenth of string: `echo ${#a}`.you can use index of string:`d=${a:3}`. for replace new word in sentence : `{string//old/new}`

for changing **color and Style** of txt in bash you can use ANSI code or tput function. e.g:
`echo -e '\033[37;40mWhite on Black\033[m'`
```
flashred=$(tput setab 0; tput setaf 1; tput blink)
red=$(tput setab 0; setaf 1)
none=$(tput sgr0)
echo -e $flashred"ERROR: "$none$red"sth is wrong."$none
```

example for using **date** and **printf**:
```
#!/bin/bash
# this will show time
today=$(date +"%d-%m-%y")
time=$(date +"%H:%M:%S")

printf -v d "current usr:\t%s\nDate:\t%s @ %s" $USER $today $time
echo "$d"
```
we have **array** too:
```
a=("a1" "a2" "a3")
a[3]="a4"
a+=("a5")
echo ${a[@]} -> retrun all array
echo ${a[@]: 2} -> from third element

```
by `declare -A dic` you can make key-val dic

for **reading file**:
```
i=1
while read f; do
        echo "Line $i is: $f"
        ((i+1))
done < file.txt
```
____________________________________________
## control structures
you can figure it out from e.g:

**if**
```
#!/bin/bash
# control flow example
a=-1
if [ $a -gt 0 ];then # or write then in next line without ;
        echo $a is positive
else
        echo $a is negative
fi # for end of if

```
**while**
```
i=0
while [$i -lt 10 ];do # or say until [ $i gt 10 ];do

        echo i:$i
        ((i+=1))
done
```
**for**
```
for i in {1..10..2};do # or for (( i=1 ; i<10; i+=2 ))
        echo $i
done
```
**function**
```
function hi_name {
        echo hi $1 # $i refered to i-th input and $@ refer to all inputs
}
hi_name Rasoul -> hi Rasoul
```
____________________________________________
## interacting with USER
you can get input when running bash.sh file, and access them in file by $i for ith input, $@ for all inputs and $# is number of inputs.

getting usr and pass example:
```
while getopts :u:p:ab option; do
        case $option in
                u) user=$OPTARG;;
                p) pass=$OPTARG;;
                a) echo "Got the A flag";;
                b) echo "Got the B Flag";;
                ?) echo "unknown $OPTARG";;
        esac
done

echo "user: $user"
echo "pass: $pass"

# for running type: file.sh -u username -p paswd -a -b
```
another example for read info from user:
```
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
```
____________________________________________
So that's it! see, bash is a beautiful thing after introducing! 
you can learn more by reading man bash or in net:) don't forget that practice make perfect.
