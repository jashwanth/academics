#!/bin/bash

function sandeep()
{
	COUNTER1=0
	sum=0
	varj=0
	var5=0
	par=0
	for param in $@
	do
		par=$param
	done
	while read line ;
	do
		COUNTER1=$((COUNTER1+1))
		#Size of page-size is found on every 2nd line ,in a set of every 15 lins in /proc/[pid]/smaps
		if [[ "$COUNTER1"%15 -eq 2 ]] ; then
			COUNTER3=0
			for j in $line
			do
				COUNTER3=$((COUNTER3+1))
				if [[ "$COUNTER3" -eq 2 ]] ; then 
					if (( j!=0)) ; then
						varj=$((var5/j))
						sum=$((sum+varj))
					fi
				fi
			done
		fi
		#Starting and Ending is found on every 1st line ,in a set of every 15 lins in /proc/[pid]/smaps
		if [[ "$COUNTER1"%15 -eq 1 ]] ; then
			for i in $line
			do
				#Converting Two Hexadecimal nos. to Decimal , and then subtracting.
				var1=`echo $i | cut -f1 -d"-"`
				var2=`echo $i | cut -f2 -d"-"`
				var3=`echo $((0x$var1))`
				var4=`echo $((0x$var2))`
				var5=$(($var4-$var3))
				break
			done
		fi
	done < "/proc/$par/smaps"
	echo "No. Of Virtual Pages for '$par'are: "$sum
	sum=0
}

result=`ps aux | tr -s ' ' | cut -f2 -d ' '`
cou=0
for rk in $result
do
	if (($cou == 0 )) ; then
		cou=$((cou+1))
	else
		echo $rk
		sandeep $rk
		# calling function venky for every pid.
	fi
done
