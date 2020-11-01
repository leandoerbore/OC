rm info.log
touch info.log
while true;do
	#cat /proc/meminfo > meminfo
	#grep "memfree:" meminfo | awk '{printf $2}' >> info.log
	free | grep "Mem" | awk '{printf $4" "}' >> info.log
	free | grep "Swap" | awk '{print $4}' >> info.log
	sleep 10
done
