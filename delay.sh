#!/bin/bash

for i in $(seq 1 5); do
	echo "i=$i"
	flist=""
	for j in $(seq 1 5); do
		if [[ $j -eq $i ]]; then
			continue
		fi
		fname="n$i_n$j.txt"
		flist="$flist $fname"
		echo "fname=$fname, flist=$flist"
		./ping.stat.sh $i $j > $fname
	done
	paste -d "," $flist > "delay.n$i.csv"
	rm $flist

done

if [[ 0 == 1 ]]; then

  388  cd moving5it500round1/
  393  for i in $(seq 1 5); do cp delay.n$i.csv ../delay.i5r1.n$i.csv; done
  395  cd ../moving5it500round2/
  396  for i in $(seq 1 5); do cp delay.n$i.csv ../delay.i5r2.n$i.csv; done
  397  cd ../moving5it500round3/
  398  for i in $(seq 1 5); do cp delay.n$i.csv ../delay.i5r3.n$i.csv; done
  400  cd ../moving5it1000round1/
  401  for i in $(seq 1 5); do cp delay.n$i.csv ../delay.i1r1.n$i.csv; done
  402  cd ../moving5it1000round2/
  403  for i in $(seq 1 5); do cp delay.n$i.csv ../delay.i1r2.n$i.csv; done
  404  cd ../moving5it1000round3/
  405  for i in $(seq 1 5); do cp delay.n$i.csv ../delay.i1r3.n$i.csv; done
  406  ll ..

fi
