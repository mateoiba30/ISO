#!/bin/bash

if [ $# -gt 2 ]
then
	echo "se supero el limite de parametros"
	exit 1
fi

if [ $# -eq 0 ]
then
	echo "Ingrese la opcion a elegir: 1 inicializar, 2 longitud, 3 imprimir"
	read opcion

	case $opcion in
		1)
			array=()
			echo "Arreglo creado con el nombre de 'array'"
			diml=0
			;;
		2)
			echo "La longitud del arreglo es de ${diml}"
			;;
		3)
			echo ${array[*]}
			;;
		*)
			echo "Opcion invalida"
			;;
	esac

else
	if [ $# -eq 1 ]
	then
		echo "Ingrese la opcion a elegir: 1 arregar al final el parametro, 2 eliminar el elemento de la posicion"
		read opcion

		case $opcion in
			1)
				array+=($1)
				diml=$(expr $diml + 1)
				;;
			2)
				if [ $1 -gt ${#array[*]} ]
				then 
					echo "el arreglo tiene ${#array[*]} elementos"
				else
					pos_borrar=$1
					cant_elementos=${#array[*]}

					if [ ${pos_borrar} -lt 1 ]
					then
						echo "Poner posiciones a partir de 1"
						exit 2
					fi

					for (( i=${pos_borrar}; i< ${cant_elementos} ; i++ ))
					do
						array[$i]=${array[$(expr $i +1)]}
					done

					diml=$(expr $diml - 1)
				fi
				;;
			*)
				echo "Numero invalido"
				;;
		esac
	else
		diml=$1
		valor=$2
		for ((i=1; i<=$diml ; i++ ))
		do
			array[$i]=$valor
		done
	fi
fi

exit 0
