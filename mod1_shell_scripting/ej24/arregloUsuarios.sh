#!/bin/bash

if [ $# -ne 1 ] && [ $# -ne 2 ]
then 
	echo "Se deben pasar 1 o 2 argumentos. '-b n' para retornar el elemento n. '-l' para la longitud. '-i' para ver todo el arreglo"
	exit 1
else
	if [ $# -eq 1 ] && [ $1 != "-l" ] && [ $1 != "-i" ]
	then
		echo "si se pasa 1 parametro, este debe ser -l o -i"
		exit 2
	else
		if [ $1 != "-b" ] && [ $# -eq 2 ]
		then
			echo "para dos parametros ingresar '-b n' (n es la posicion a analizar)"
			exit 3
		fi
	fi
fi

texto_users=$(cat /etc/group | grep "users" | cut -d ':' -f4)
cantidad_users=$( echo ${texto_users} | awk -F',' '{print NF}' )
arreglo_users=()

for ((i=1; i<=${cantidad_users}; i++))
do
	arreglo_users[${i}]=$(echo $texto_users | cut -d ',' -f${i} )
done

case $1 in
	"-l")
		echo "La longitud del arreglo es de $cantidad_users"
		;;
	"-i")
		echo ${arreglo_users[*]}
		;;
	"-b")
		if [ $2 -gt $cantidad_users ]
		then
			echo "solo hay $cantidad_users usuario/s"
		else
			echo "elemento $2 : ${arreglo_users[${2}]}"
		fi
		;;
	esac

exit 0
