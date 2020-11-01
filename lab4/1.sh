#rmtrash
file=$1

if [[ -z $1 ]] || ! [[ -e $1 ]];then
	echo "Пусто"
	exit 1
fi

if ! [[ -e ~/.trash ]];then
	mkdir ~/.trash
	echo "Создал trash"
fi

count=$(cat .number)
let number=count+1
echo $number > .number
echo "Номер = $count"

ln "$1" ~/.trash/"$count"
rm $1

echo "$PWD/$1:$count" >> ~/.trash.log
