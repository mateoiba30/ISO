#!/bin/bash

case $# in
	0)
		select option in inicializar longitud imprimir salir
		do
			case $option in
				"inicializar")
					array=()
					echo Arreglo inicializado con el nombre 'array'
					;;
				"longitud")
					echo La longitud es de ${#array[*]}
					;;
				"imprimir")
					echo array= "${array[*]}"
					;;
				"salir")
					exit 1
					;;
				*)
					echo opcion invalida
					;;
			esac

		done
	;;

	1)
		select option in agregar eliminar salir
		do
			case $option in
				"agregar")
					array+=($1)
					;;
				"eliminar")
					if [ $1 -gt ${#array[*]} ]
					then
						echo te pasaste de la cantidad de elementos
					else
						variable=${array[$1]}
						array=($(echo "${array[@]}" | sed "s/$variable//g"))
					fi
					;;
				"salir")
					exit 1
					;;
				*)
					echo opcion invalida
					;;
			esac
		done
	;;
	
	2)
		array=()
		for((i=1; i<=$1 ; i++ ))
		do
			array[$i]=$2
		done
	;;

	*)
		echo cantidad de parametros invalida
		exit 1
	;;	

esac


