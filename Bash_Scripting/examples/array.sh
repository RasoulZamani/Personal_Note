#!/bin/bash
a=("a1" "a2" "a3")
a[3]="a4"
a+=("a5")
echo ${a[@]}
echo ${a[@]: 2}
