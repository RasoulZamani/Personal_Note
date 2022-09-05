#!/bin/bash
# this is my first bash script!

# first hello to all world:
echo hello world!

# now make some directories
mkdir {a..d}_{1..5}

# save list of them to another file
ls >ls_out.txt

# show ls_out.txt contents:
cat ls_out.txt
