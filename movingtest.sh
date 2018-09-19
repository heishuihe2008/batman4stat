#!/bin/sh

echo "$0: sleep 60 seconds to wait system startup..."
sleep 60

cd /etc/app

if [ -e "movingON" ]; then
	echo "movingON ..."
else
	echo "movingON not exist, exit."
	exit
fi

hostname=$(uci get system.@system[0].hostname);
echo "hostname=[$hostname]"

batstatlogfile="$hostname.batstat.log"
echo "batstatlogfile=$batstatlogfile"

pinglogfile="$hostname.ping"
echo "pinglogfile=$pinglogfile"

batctl o > "$hostname.batctl.orig.txt"

time=300
#batstat will run 300 seconds
sh ./batstat.sh $time > "$batstatlogfile" &

NodeNum=5
packetcount=300

for i in $(seq 1 $NodeNum); do
	node=n$i;
	if [[ $node != $hostname ]]; then
#		echo "batctl ping"
		batctl ping -c $packetcount -R $node > "$hostname.ping$i.log" &
	fi 
done

