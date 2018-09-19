#!/bin/sh

datestr=$(date +"%Y-%m-%d %H:%M:%S")
logfile="batconfig.log"

echo $datestr

version=BATMAN_IV
ogmit=1000
hop_penalty=5
txpower=3

if [ $# -ge 1 ]; then
	version=$1
fi

if [ $# -ge 2 ]; then
	ogmit=$2
fi

if [ $# -ge 3 ]; then
	hop_penalty=$3
fi

if [ $# -ge 4 ]; then
	txpower=$4
fi

echo "version: $version"
echo "ogmit: $ogmit"
echo "hop_penalty: $hop_penalty"
echo "txpower: $txpower"

uci set network.batnet0.routing_algo=$version
uci set network.batnet1.routing_algo=$version
uci commit network

uci set batman-adv.bat0.orig_interval=$ogmit
uci set batman-adv.bat1.orig_interval=$ogmit

uci set batman-adv.bat0.hop_penalty=$hop_penalty
uci set batman-adv.bat1.hop_penalty=$hop_penalty
uci commit batman-adv

uci set wireless.radio0.txpower=$txpower
uci set wireless.radio1.txpower=$txpower

uci set wireless.default_radio0.mcast_rate='18000';
uci set wireless.default_radio1.mcast_rate='18000'; 

uci commit wireless

wifi

echo "=========  network ================="
cat /etc/config/network
echo "===================================="

echo "=========  batman-adv ================="
cat /etc/config/batman-adv
echo "======================================="

echo "=========  wireless ================="
cat /etc/config/wireless
echo "======================================="

