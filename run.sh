#!/bin/bash
avg=1
for (( j=1; j<=1001; j+=10))
do
sum=0
for (( i=1; i<=$avg; i++))
do
./dq.py $j 100000 1 1000000 1 &
wait $!
tag=$(tail -n 1 exp1.dat)
var=$(echo $tag|awk '{print $4}')
#echo $var
sum=`echo $sum + $var|bc`
done
result=`echo $sum / $avg | bc -l`
echo $result
echo "$j $result" >> mytestfile1.txt
done
