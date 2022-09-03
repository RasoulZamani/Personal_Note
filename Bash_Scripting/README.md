# **BASH**
_____________________________________________
This file is summarize and some notes from:

Lynda.Learning.Bash.scripting course

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
`ls > /dev/null ` -> write ls stdout to file in /dev
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
