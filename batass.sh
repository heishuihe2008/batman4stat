#!/bin/sh

datestr=$(date +"%Y-%m-%d %H:%M:%S")
logfile="batstat.log"

echo "#$datestr"
echo "# k n mac sig noise rx tx throughput"

k=1
timeout=2

if [ $# -ge 1 ]; then
	timeout=$1
	#echo "Timeout: $timeout"
fi

while true
do

	#awk -v VARIABLE=$VAR '{ print VARIABLE }'
	iwinfo wlan1 ass | awk -v k=$k '
		BEGIN 
		{
			RS="\n\n"
			FS=" "
			n=1
		}

		{
			print k, n, $1, $2, $5, $13, $21, $30

			n++
		}

		END 
		{

		}
	'
	let k=k+1
	sleep $timeout
done
