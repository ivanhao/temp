#!/bin/bash

for f in `ls ./|grep 'txt$'`
do
    echo $f
    sed -i '/^$/d' $f
    line=`cat $f|awk '{print NR}'|tail -n1`
    echo $line
    for i in `seq 1 $line`
    do
        echo $i
        rs=`awk 'NR=='$i'{print $4}' $f`
        echo $rs
        if [ $rs ];then
            c=`wget -O - --timeout=10 --waitretry=2 --tries=3 $rs|wc -l`
            echo 'c='$c
            if [ $c == 0 ];then
                if [ $i == 1 ];then
                    awk 'NR=='$i'{print $0}' $f>$f.error
                else
                    awk 'NR=='$i'{print $0}' $f>>$f.error
                fi
            else
                if [ $i == 1 ];then
                    awk 'NR=='$i'{print $0}' $f>$f.result
                else
                    awk 'NR=='$i'{print $0}' $f>>$f.result
                fi
            fi
            continue
        else
            continue
        fi
    done
done
