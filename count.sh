#!/bin/bash

for f in `ls ./|grep 'txt'`
do
    echo $f
    sed -i '/^$/d' $f
    line=`cat $f|awk '{print NR}'|tail -n1`
    echo $line
done
