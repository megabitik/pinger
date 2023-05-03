#!/bin/bash

declare -i counter=100
declare -r -i interval=3
declare verbose=true
declare timestamp
declare logfile_prefix='pings_'
declare logfile_ext='.log'
declare logfile_name

while [ $counter -gt 0 ]; do
	$verbose && echo "[$counter]"
	timestamp=`date '+%H%M%S'`
	logfile_name=$logfile_prefix$timestamp$logfile_ext
	touch $logfile_name
	for h in `cat hosts`; do
		ping -c1 -w1 "$h" >/dev/null && echo "$h" >> $logfile_name &
	done
	
	# $interval should be more than ping wait time for the correct alive hosts output
	sleep "$interval"
	$verbose && ./show_stats.py $logfile_name
	let counter-=1
done

