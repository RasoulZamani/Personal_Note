#!/bin/bash
# this bash file for using ping
ping_result=$(ping -c 1 example.com | grep 'bytes from' |cut -d = -f 4)
echo "the ping was $ping_result"
