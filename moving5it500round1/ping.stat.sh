#!/bin/bash

N=300
INVALID_DELAY="NaN"

function init_result()
{
	for i in $(seq 1 $N); do
		result[$i]=$INVALID_DELAY
	done
}

function check_result()
{
	for i in $(seq 1 $N); do
		if [[ "${result[$i]}" == "$INVALID_DELAY" ]]; then
			echo "No value: $i"
		fi
	done
}

function display_result()
{
	for i in $(seq 1 $N); do
		echo "$i ${result[$i]}"
	done
}

function dump_delay()
{
	for i in $(seq 1 $N); do
		echo "${result[$i]}"
	done
}

function get_result()
{
	fname=$1
	init_result
	[[ ! -e $fname ]] && return

	x=$(cat $fname | grep icmp_seq | tr -s '=' ' ' | awk '{print $6, $10}')

	i=0
	for y in $x; do
		j=$(($i%2))
		if [ $j -eq 0 ]; then
			seq=$y
		else
			delay=$y
			result[$seq]="$delay"
		fi	
		i=$(($i+1))
	done
	#echo "j $i"
}

fname="n$1.ping$2.log"
get_result $fname
dump_delay

#check_result
#display_result

