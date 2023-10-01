#!/bin/bash

if [ $# -ne 0 ]
then
	echo "No se deben pasar parametros"
	exit 1
fi

echo "Elija una opcion: 1 push, 2 pop, 3 lenght, 4 print, 5 para esc, 6 ver elementos y su indice"
read opcion
pila=()
terminar=0
dimension=0

if [ $opcion -eq 5 ]
then
	terminar=1
fi

while [ $terminar -ne 1 ]
do
	case $opcion in 
		1)
			echo "escriba el elemento a pushear:"
			read elemento
			pila=$(echo "$elemento ${pila[*]}")
			dimension=$(expr $dimension + 1) #mas sencillo si agrego atras con pila+=($elemento)
			;;
		2)
			pila=$(echo ${pila[*]} | cut -d ' ' --complement -f1)
			dimension=$(expr $dimension - 1) #si agrego antras, podría eliminar con unset en la pos ${#pila[*]} - 1
			;;
		3)
			echo $dimension ${#pila[*]}
			;;
		4)
			echo ${pila[*]}
			;;
		5)
			terminar=1
			;;
		6)
			contador=0
			for i in ${pila[@]}
			do
				echo elemento $contador : $i
				contador=$(expr $contador + 1)
			done
			;;

		*)
			echo "Opcion invalida"
		esac
	
	if [ $terminar -ne 1 ]
	then	
		echo "Elija otra opcion:"
		read opcion
	fi
done

exit 0



