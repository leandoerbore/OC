#FouthPizda
HomeDir="/home/user"
dir=$(pwd)
if grep -q "$HomeDir" <<< "$dir"
then
	echo "$HomeDir"
	echo "0"
else
	echo "Bad condition (wrong directory)"
	echo "1"
fi

