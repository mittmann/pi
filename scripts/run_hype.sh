#!/bin/bash

while IFS="," read f1 f2 f3 f4 f5 f6 f7
do
	if [ "$f1" != "\"name\"" ]; then #if its not the first line
        	RUNNOT=${f4//\"/}
	       	RUNNO=`echo $RUNNO | cut -d'.' -f1`
        	VERSION=${f5//\"/}
		THREADS=${f6//\"/}                
		let maxcore=$THREADS-1
		OMP_PLACES="{0-$maxcore}"
 		OMP_PROC_BIND=true
		export OMP_NUM_THREADS=$THREADS
		./$VERSION 10000000 	
	fi
done < pi_doe_hype.csv 
