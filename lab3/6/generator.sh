while true;do
	read line
	case $line in
		+)
			kill -usr1 $(cat .pid)
			;;
		\*)
			kill -usr2 $(cat .pid)
			;;
		TERM)
			kill -sigterm $(cat .pid)
			exit
			;;
		*)
			:
			;;
	esac
done

