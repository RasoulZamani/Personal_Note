#!/bin/bash
# getting user and pass from user

if [ $# -lt 2 ]; then
	cat <<- EOM
	this command require 2 arguments:
	username and passsword
	EOM
else

	while getopts :u:p:ab option; do
		case $option in
			u) user=$OPTARG;;
			p) pass=$OPTARG;;
			a) echo "Got the A flag";;
			b) echo "Got the B Flag";;
			?) echo "unknown $OPTARG";;
		esac
	done
fi

echo "user: $user"
echo "pass: $pass"

