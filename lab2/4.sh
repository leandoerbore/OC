rm fouth.txt
for i in $(ps ax -o pid); do
	status="/proc/"$i"/status"
	sched="/proc/"$i"/sched"

	pid=$(grep -s "^Pid:" $status | awk '{print $2}')
	ppid=$(grep -s "^PPid:" $status | awk '{print $2}')
	sum_exec_runtime=$(grep -s "sum_exec_runtime" $sched | awk '{print $3}')
	nr_switches=$(grep -s "nr_switches" $sched | awk '{print $3}')
	if [[ -z $pid ]]; then
		continue;
	fi

	if [[ -z $ppid ]]; then
		ppid=0
	fi
	art=$(echo "scale=6; $sum_exec_runtime/$nr_switches" | bc | awk '{printf "%f", $0}')
	echo "ProcessID=$pid : Parent_ProcessID=$ppid : Avarage_Running_Time=$art"

done | sort -n -t "=" -k3 >fouth.txt
#nano fouth.txt
