#SecondPizda
text=""
while :
do
	read string
	if [[ "$string" = "q" ]]
		then
		echo "$text"
		exit
	fi
	text="$text$string "
done
