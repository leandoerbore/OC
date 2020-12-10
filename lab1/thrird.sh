#ThrirdPizda
while :
do
	clear
	echo "Текстовое меню"
	echo "Выберите пункт"
	echo "1) Редактор nano"
	echo "2) Редактор vi"
	echo "3) Браузер links"
	echo "4) Выход из меню"
	read str
	case $str in
		1)
			echo "Введите название файла"
			read name
			nano $name;;
		2)
			echo "Введите название файла"
			read name
			vi $name;;
		3)
			links;;
		4)
			exit;;
	esac
done
