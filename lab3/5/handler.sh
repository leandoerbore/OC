{
n=1
mode="+"
t=0
(tail -f pipe) |
while true; do
	read line
	case $line in
		quit)
			echo "exit"
			exit 0
			;;
		+)
			mode="+"
			;;
		\*)
			mode="*"
			;;
		[0-9]*)
			let n=n$mode$line 2>/dev/null || t=1
			if [[ $t -eq 1 ]]; then
				echo "Data error_1"
				kill $(cat .pid)
				exit 1
			fi
			echo "$n"
			;;
		*)
			echo "Data error_2"
			#kill $(cat .pid)
			exit 1
			;;
	esac
done
}&
