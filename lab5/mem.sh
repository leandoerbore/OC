rm report.log
touch report.log
counter=0
PID=$$
echo "PID=$PID" > report.log
echo $$ > .pid

while true; do
	for ((i=1; i < 11; i++)); do
		mas+=($i)
	done
	#echo "$counter) ${mas[$counter]}"
	#echo "size: ${#mas[@]}"
	counter=$(($counter+1))
	if (( counter % 100000 == 0 ));then
		counter=0
		echo "${#mas[@]}" >> report.log
	fi
done

