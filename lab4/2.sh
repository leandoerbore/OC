#untrash
file=$1

if [[ -z $1 ]];then
	echo "Пусто"
	exit 1
fi

mas=( $(grep "$1" ~/.trash.log) )

for i in ${mas[@]};do
	file=$(echo "$i" | cut -d: -f1)
	read -p "Восстанавливаем? : $file : " answer
	case $answer in
	y)
		number=$(echo "$i" | cut -d: -f2)
		ln ~/.trash/"$number" $file 2>/dev/null ||
		{
		 read -p "Такой файл уже существует, поменяйте имя: " name ;
		 ln ~/.trash/"$number" $name 2>/dev/null ;
		}
		sed -i 's/${i}/deleted/' ~/.trash.log
		rm ~/.trash/$number
		;;
	n)
		;;
	esac
done


