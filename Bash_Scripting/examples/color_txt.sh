#!/bin/bash
# coloring and styling txt by tput 

flashred=$(tput setab 0; tput setaf 1; tput blink)
red=$(tput setab 0; setaf 1)
none=$(tput sgr0)
echo -e $flashred"ERROR: "$none$red"sth is wrong."$none
