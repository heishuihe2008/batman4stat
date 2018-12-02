#!/bin/bash

fname="n$1.ping$2.log"
if [[ -f $fname ]]; then
	
	pktloss=$(tail -10 $fname | awk '/transmitted/ { print $1, $4, $6}');
	rtt=$(tail -10 $fname |tr -s '/' ' '| awk '/rtt/ { print $7,$8,$9,$10}');

	echo "$1 $2 $pktloss $rtt"

fi

#for i in $(seq 1 5); do  for j in $(seq 1 5); do ../plr.rtt.stat.sh $i $j; done done > plr.i5r1.rtt.txt
