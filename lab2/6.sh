#ps ao %mem,command | sort -r | head -2
rm sixth.txt
for i in $(ps axo pid)
do
	pid=$(grep -s "^Pid:"  /proc/$i/status | awk '{print $2}')
	mem=$(grep -s "^VmRSS:" /proc/$i/status | awk '{print $2}')
	if [[ -z $mem ]]
	then
		continue
	else
		echo "/pros) $pid : $mem" #>> sixth.txt
	fi
done | sort -rn -k4 | head -n 1  >sixth.txt
cat sixth.txt

top -bn1 | sort -rk10 | head -n 5 | tail -n 1 | awk '{print "  top) "$1" : "$6}'

