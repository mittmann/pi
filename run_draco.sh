#!/bin/bash
machine=draco
while IFS="," read f1 f2 f3 f4 f5 f6 f7 f8
do
	if [ "$f1" != "\"name\"" ]; then #if its not the first line
        	VERSION=${f5//\"/}
		THREADS=${f6//\"/}                
		let maxcore=($THREADS-1)*2
		if [[ threads != 32 ]]; then
			export OMP_PLACES="{0:$maxcore:2}"
			else
			unset OMP_PLACES
			fi
 		export OMP_PROC_BIND=true
		export OMP_NUM_THREADS=$THREADS
		time=`./$VERSION 3000000000 | grep TIME | cut -f3 -d' '`
		echo "$f1,$f2,$f3,$f4,$f5,$f6,$f7,"$machine",$time"  
	else
		echo "$f1,$f2,$f3,$f4,$f5,$f6,$f7,"\"machine\"",$f8"  
		
	fi
    done < pi_doe_$machine.csv > output_$machine.csv
