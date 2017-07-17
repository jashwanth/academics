#!/bin/bash

function sandeep()
{
	for param in $@
	do
		par=$param
	done
	while read line ;
	do
		echo $line
	done < "/proc/$par/smaps"
	echo
}

result=`ps aux | tr -s ' ' | cut -f2 -d ' '`
#result=`ps aux | tr -s ' ' | cut -f2,11 -d ' '`
cou=0
for rk in $result
do
	if (($cou == 0 )) ; then
		cou=$((cou+1))
	else
		echo $rk >> a.txt
		venky $rk >> a.txt
	fi
done
