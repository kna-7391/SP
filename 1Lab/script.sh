#!/bin/bash

#comment
function first {
	pwd;
}

function second {
	echo "Введите имя пользователя:"

	while [[ "1" == "1" ]];
		do
			read varname
			#Костыльный поиск по имени      cut -d: -f1 /etc/passwd | grep -w varname
			check=`cut -d: -f1 /etc/passwd | grep -w $varname`
			if [[ "$varname" != "$check" ]];
				then
					echo "Ошибка! Такого пользователя нет!" >&2
					echo "Попробуйте ещё раз:"
				else
					echo "Пользователь с именем ${varname} существует в системе!";
					break;
			fi
	done
}
function trete {
	echo "Введите каталог:"

	while [[ "1" == "1" ]];
		do
			read catalogname
			if [ -d "$catalogname" ]; then
				echo "Такой каталог есть!";
				break;
			else
				echo "Ошибка! Каталог с таким именем не найден">&2
				echo "Попробуйте ещё раз:"
	
			fi
	done
}

function fourth {

	kolvo=0
	kolvo_dir=0

	echo "Введите имя пользователя:"
	while [[ "1" == "1" ]];
		do
			while [[ "1" == "1" ]];
				do
					read varname

					check=`cut -d: -f1 /etc/passwd | grep -w $varname`
					if [[ "$varname" != "$check" ]];
						then
							echo "Ошибка! Такого пользователя нет!">&2
							echo "Попробуйте ещё раз:"
						else
							echo "Пользователь с именем ${varname} существует в системе!";
							break;
					fi
			done
		for file in `find / -type f -name "*"`
			do
			if [ -d "$file" ]
			then
			kolvo_dir=$((kolvo_dir+1))
				elif [ -f "$file" ]
			then
			kolvo=$((kolvo+1))
			fi
			done
	echo " Всего было найдено ${kolvo} файлов с началом поиска от корня"
	break;
	done
}




echo "  Программа вывода имени текущего каталога, проверка на наличие пользователя и каталога в системе, вывод обычных файлов для введённого пользователя";

echo "	Разработчик Калинин Никита"
while [[ "1" == "1" ]];
do

echo "Для выполнения операции выберите номер из списка, напишите и нажмите "Enter""
echo "	1) Вывод текущей директории"
echo "	2) Поиск пользователя среди зарегистрированных в системе по имени"
echo "	3) Проверка на наличие каталога"
echo "	4) Вывод количества файлов, которые принадлежат введённому пользователю по имени"


while [[ "1" == "1" ]];
do
echo "	Введите число:"
read choice

if [[ $choice == "1" ]]
	then first
	break
elif [[ $choice == "2" ]]
	then second
	break
elif [[ $choice == "3" ]]
	then trete
	break
elif [[ $choice == "4" ]]
	then fourth
	break
else echo "Ошибка! Вы ввели некоректное значение. Повторите ещё раз!">&2
fi
done
echo "Хотите Выйти? (n)"

read yno

if [[ $yno == "n" ]]
then
	break;
fi
if [[ $yno == "N" ]]
then
	break;
fi
if [[ $yno == "н" ]]
then
	break;
fi
if [[ $yno == "Н" ]]
then
	break;
fi

done
echo "Хорошего дня!"


