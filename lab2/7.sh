for pid in $(ps axo pid); do
 	rchar=$(grep -s "rchar" /proc/$pid/io | awk '{print $2}')

	if [[ -z "$rchar" ]]; then
		continue
	fi
	echo "$pid $rchar"
done >s1.txt
sleep 5s

for pid in $(ps axo pid); do
	rchar=$(grep -s "rchar" /proc/$pid/io | awk '{print $2}')

	if [[ -z "$rchar" ]]; then
		continue
	fi
	echo "$pid $rchar"
done >s2.txt

while read line; do
	pid1=$(echo $line | awk '{print $1}')
	bytes1=$(echo $line | awk '{print $2}')
	tempLine=$(grep -s "^$pid1" s2.txt)

	if [[ $tempLine ]]; then
		bytes2=$(echo $tempLine | awk '{print $2}')
		answer=$(echo "scale=9; $bytes2-$bytes1" | bc | awk '{printf "%f", $0}')
		name=$(ps $pid1 | awk '{print $5}' | tail -n1)
		echo "$name) $pid1 : $answer "
	else
		continue
	fi
done < s1.txt | sort -rnk2 | head -n 3 >s3.txt
nano s3.txt

