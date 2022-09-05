#!/bin/bash
# comparison

[[ "cat" == "cat" ]]
echo $?

[[ "cat" = "dog" ]]
echo $?

[[ 1 -lt 0 ]]
echo $?
