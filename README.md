# batman4stat
batman-adv IV field test results

dir:
	+batstat-4n			4 static nodes in line test result
	
	+batstat-7n-0916	7 static nodes, 4 in line plus 3 additional nodes, 16 Sep. 2018
	
	+batstat-7n-0917	7 static nodes, 4 in line plus 3 additional nodes, 17 Sep. 2018
	
	+moving5it500round1	5 nodes, 4 static nodes in line, plus a moving node, ogm_interval=500ms, round1
	
	+moving5it500round2	5 nodes, 4 static nodes in line, plus a moving node, ogm_interval=500ms, round2
	
	+moving5it500round3	5 nodes, 4 static nodes in line, plus a moving node, ogm_interval=500ms, round3
	
	+moving5it1000round1	5 nodes, 4 static nodes in line, plus a moving node, ogm_interval=1000ms, round1
	
	+moving5it1000round2	5 nodes, 4 static nodes in line, plus a moving node, ogm_interval=1000ms, round2
	
	+moving5it1000round3	5 nodes, 4 static nodes in line, plus a moving node, ogm_interval=1000ms, round3
	
	batstat.sh		shell script to get TQ using 'batctl o'
	batass.sh		shell script to get wlan associate information using 'iwinfo wlan1 associate'
	movingtest.sh	shell script to collect test data
	
	tq_stat.m		Matlab function to extract TQ data from log file.
	run.m			Matlab script to run.
	
file type and file name rule:
	log		TQ record, which have 7 columns: time_index, neigh_index, orig, neigh, TQ, last_seen, is_router
	
	png		TQ plot, n1o2.m000.png means: recored in Node 1, TQ of Originator 2, time from minute 0 (10 minutes by default)
	
	fig		Matlab figure
	
	mat		Matlab .mat file
	
