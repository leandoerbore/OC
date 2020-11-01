echo $$ > .pid
n=1
mode="+"
usr1()
{
	mode="+"
}
usr2()
{
	mode="*"
}
sigterm()
{
	echo "Stopped by sigterm"
	exit 0
}
trap 'sigterm' SIGTERM
trap 'usr2' USR2
trap 'usr1' USR1
while true; do
	case $mode in
		+)
			let n=$n+2
			;;
		\*)
			let n=$n*2
			;;
	esac
	echo $n
	sleep 5
done
