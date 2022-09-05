#!/bin/bash

i=1
while read f; do
        echo "Line $i is: $f"
        ((i+1))
done < ls_out.txt
