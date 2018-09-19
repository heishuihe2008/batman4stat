#!/bin/sh

datestr=$(date +"%Y-%m-%d %H:%M:%S")
logfile="batstat.log"

cd /etc/app

#echo $datestr

k=1
timeout=300000

if [ $# -ge 1 ]; then
	timeout=$1
	#echo "Timeout: $timeout"
fi

# output format:
# k n orig neigh tq lastseen isdefault_route

#while true
until [ $k -gt $timeout ];
do

	#awk -v VARIABLE=$VAR '{ print VARIABLE }'

	batctl o | grep "wlan.]" | tr -d "()s" | awk -v k=$k '
		BEGIN 
		{
			FS=" "
			n=1
		}

		{
			if ($1=="*")
				print k, n, $2, $5, $4, $3, "1"
			else
				print k, n, $1, $4, $3, $2, "0"

			n++
		}

		END 
		{

		}
	'
	let k=k+1
	sleep 1
	
done