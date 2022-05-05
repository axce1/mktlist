#!/bin/bash

cat $1 | sort -t. -n -k1,1 -k2,2 -k3,3 -k4,4 | uniq | awk -f script.awk > subnets.rsc
