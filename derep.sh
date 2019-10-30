#!/bin/bash
f='result-derep.txt'
echo $f
sed -i '/^$/d' $f
line=`cat $f|awk '{print NR}'|tail -n1`
echo $line
for j in 领导干部在线 保山在线 大同在线 葫芦岛在线 金华在线 晋中在线 漯河在线 宣城在线 鄂尔多斯在线 盘锦在线网 青海在线 四平在线
do
    sed -i '/'$j'/d' $f
done
