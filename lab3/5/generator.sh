echo $$ > .pid
while true; do
	read line
	echo "$line" > pipe
	if [[ "$line" -eq "quit" ]]; then
		exit
	fi 2>/dev/null
done
